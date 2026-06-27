# ======================================================================
#   ECOMMERCE BACKEND - PUSH SUON CODE VA TU DONG PR MERGE (FAKE DATE)
#   Tac gia: phamvanduy1008
#   Repo: https://github.com/phamvanduy1008/Ecommerce-Backend.git
#   Lich trinh: Bat dau tu 20/06/2026 - Moi task cach nhau dung 1 ngay
# ======================================================================

$RepoUrl = "https://github.com/phamvanduy1008/Ecommerce-Backend.git"
$Owner = "phamvanduy1008"
$RepoName = "Ecommerce-Backend"
$AuthorName = "phamvanduy1008"
$AuthorEmail = "phamvanduy.dev@gmail.com"

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "   ECOMMERCE BACKEND - QUY TRINH PUSH SUON CODE VA TU DONG TAO PR" -ForegroundColor Cyan
Write-Host "   Repository: $RepoUrl" -ForegroundColor Cyan
Write-Host "   Lich trinh: 20/06/2026 (Suon code) -> Moi PR cach nhau 1 ngay" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Chon phuong thuc tao Pull Request:" -ForegroundColor Yellow
Write-Host " [1] Git PR Merge mo phong (Khuyen dung - khong can Token):" -ForegroundColor Green
Write-Host "     - Push suon code len main (20/06/2026)."
Write-Host "     - Tao branch feature -> commit ngay fake -> merge --no-ff vao main (ngay fake)."
Write-Host "     - Giu 100% ngay fake (20/06 -> 27/06/2026) tren GitHub Commits va Network Graph."
Write-Host " [2] GitHub Live API (Tao PR that tren tab Pull Requests cua GitHub):" -ForegroundColor Green
Write-Host "     - Can GitHub Personal Access Token (PAT)."
Write-Host "     - Push suon code len main truoc, sau do push tung nhanh, goi API tao PR va merge."
Write-Host ""
$choice = Read-Host "Nhap lua chon cua ban (1 hoac 2, mac dinh la 1)"
if ([string]::IsNullOrWhiteSpace($choice)) { $choice = "1" }

$githubToken = ""
if ($choice -eq "2") {
    $githubToken = Read-Host "Vui long nhap GitHub Personal Access Token (PAT)"
    if ([string]::IsNullOrWhiteSpace($githubToken)) {
        Write-Host "Khong co token, tu dong chuyen ve Che do 1 (Git PR Merge mo phong)." -ForegroundColor Yellow
        $choice = "1"
    }
}

# 1. Sao luu .git cu neu co
if (Test-Path ".git") {
    Write-Host "`n[Buoc 1] Dang lam moi Git repository..." -ForegroundColor Yellow
    if (Test-Path ".git_old_backup") {
        Remove-Item -Recurse -Force ".git_old_backup"
    }
    Move-Item -Path ".git" -Destination ".git_old_backup" -Force
}

# 2. Khoi tao repository moi tren main
Write-Host "[Buoc 2] Khoi tao git repository moi tren nhanh main..." -ForegroundColor Green
git init -b main
git config user.name "$AuthorName"
git config user.email "$AuthorEmail"
git remote add origin $RepoUrl

# 3. PUSH SUON CODE LEN MAIN TRUOC (20/06/2026)
Write-Host "`n======================================================================" -ForegroundColor Cyan
Write-Host " [Buoc 3] PUSH SUON CODE LEN MAIN TRUOC (Ngay: 2026-06-20)" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan

$skeletonFiles = @(
    ".gitignore",
    "ecommerce/.gitignore",
    "ecommerce/.gitattributes",
    "ecommerce/pom.xml",
    "ecommerce/mvnw",
    "ecommerce/mvnw.cmd",
    "ecommerce/.mvn/",
    "ecommerce/src/main/resources/application.properties",
    "ecommerce/src/main/java/com/example/ecommerce/EcommerceApplication.java",
    "ecommerce/src/test/java/com/example/ecommerce/EcommerceApplicationTests.java"
)

foreach ($f in $skeletonFiles) {
    git add "$f"
}

$env:GIT_AUTHOR_DATE = "2026-06-20T09:30:00"
$env:GIT_COMMITTER_DATE = "2026-06-20T09:30:00"
git commit -m "feat: initial project skeleton with Spring Boot and Maven configuration"

# Dinh nghia 7 PR tiep theo, moi PR cach nhau dung 1 ngay
$prTasks = @(
    @{
        PrNumber = 1
        Branch = "feature/user-persistence"
        Title = "feat(user): add User JPA entity and UserRepository for user persistence"
        CommitDate = "2026-06-21T10:00:00"
        MergeDate  = "2026-06-21T16:30:00"
        Files = @("ecommerce/src/main/java/com/example/ecommerce/entity/User.java", "ecommerce/src/main/java/com/example/ecommerce/repository/UserRepository.java")
    },
    @{
        PrNumber = 2
        Branch = "feature/jwt-authentication"
        Title = "feat(auth): implement JWT authentication, Spring Security filter chain and auth controller"
        CommitDate = "2026-06-22T10:00:00"
        MergeDate  = "2026-06-22T16:30:00"
        Files = @(
            "ecommerce/src/main/java/com/example/ecommerce/dto/LoginRequest.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/RegisterRequest.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/JwtUtil.java",
            "ecommerce/src/main/java/com/example/ecommerce/security/CustomUserDetails.java",
            "ecommerce/src/main/java/com/example/ecommerce/security/CustomUserDetailsService.java",
            "ecommerce/src/main/java/com/example/ecommerce/security/JwtAuthenticationFilter.java",
            "ecommerce/src/main/java/com/example/ecommerce/config/SecurityConfig.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/AuthService.java",
            "ecommerce/src/main/java/com/example/ecommerce/controller/AuthController.java"
        )
    },
    @{
        PrNumber = 3
        Branch = "feature/product-catalog"
        Title = "feat(product): add product catalog management with optimistic locking and admin controls"
        CommitDate = "2026-06-23T10:00:00"
        MergeDate  = "2026-06-23T16:30:00"
        Files = @(
            "ecommerce/src/main/java/com/example/ecommerce/entity/Product.java",
            "ecommerce/src/main/java/com/example/ecommerce/repository/ProductRepository.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/ProductRequestDto.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/ProductService.java",
            "ecommerce/src/main/java/com/example/ecommerce/controller/ProductController.java"
        )
    },
    @{
        PrNumber = 4
        Branch = "feature/cart-subsystem"
        Title = "feat(cart): implement shopping cart and cart item management with price snapshot"
        CommitDate = "2026-06-24T10:00:00"
        MergeDate  = "2026-06-24T16:30:00"
        Files = @(
            "ecommerce/src/main/java/com/example/ecommerce/entity/Cart.java",
            "ecommerce/src/main/java/com/example/ecommerce/entity/CartItem.java",
            "ecommerce/src/main/java/com/example/ecommerce/repository/CartRepository.java",
            "ecommerce/src/main/java/com/example/ecommerce/repository/CartItemRepository.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/CartResponseDto.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/CartItemResponseDto.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/CartService.java",
            "ecommerce/src/main/java/com/example/ecommerce/controller/CartController.java"
        )
    },
    @{
        PrNumber = 5
        Branch = "feature/order-processing"
        Title = "feat(order): implement transactional order checkout with inventory validation and mock payment"
        CommitDate = "2026-06-25T10:00:00"
        MergeDate  = "2026-06-25T16:30:00"
        Files = @(
            "ecommerce/src/main/java/com/example/ecommerce/entity/Order.java",
            "ecommerce/src/main/java/com/example/ecommerce/entity/OrderItem.java",
            "ecommerce/src/main/java/com/example/ecommerce/entity/OrderStatus.java",
            "ecommerce/src/main/java/com/example/ecommerce/repository/OrderRepository.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/OrderRequest.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/OrderResponse.java",
            "ecommerce/src/main/java/com/example/ecommerce/dto/OrderItemResponse.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/OrderService.java",
            "ecommerce/src/main/java/com/example/ecommerce/service/PaymentService.java",
            "ecommerce/src/main/java/com/example/ecommerce/controller/OrderController.java"
        )
    },
    @{
        PrNumber = 6
        Branch = "feature/exception-handlers"
        Title = "feat(exception): add global exception handling and custom security access handlers"
        CommitDate = "2026-06-26T10:00:00"
        MergeDate  = "2026-06-26T16:30:00"
        Files = @(
            "ecommerce/src/main/java/com/example/ecommerce/exception/ResourceNotFoundException.java",
            "ecommerce/src/main/java/com/example/ecommerce/exception/GlobalExceptionHandler.java",
            "ecommerce/src/main/java/com/example/ecommerce/security/CustomAuthenticationEntryPoint.java",
            "ecommerce/src/main/java/com/example/ecommerce/security/CustomAccessDeniedHandler.java"
        )
    },
    @{
        PrNumber = 7
        Branch = "feature/documentation-guide"
        Title = "docs: add project README and automated git push scripts"
        CommitDate = "2026-06-27T10:00:00"
        MergeDate  = "2026-06-27T16:30:00"
        Files = @("README.md", "push_to_github.bat", "push_to_github.ps1")
    }
)

if ($choice -eq "1") {
    Write-Host ""
    Write-Host "=== DANG CHAY CHE DO 1: TAO FEATURE BRANCH VA MERGE PULL REQUEST MO PHONG VOI FAKE DATE ===" -ForegroundColor Cyan
    Write-Host ""
    
    foreach ($task in $prTasks) {
        $num = $task.PrNumber
        $branch = $task.Branch
        $title = $task.Title
        $cDate = $task.CommitDate
        $mDate = $task.MergeDate
        
        Write-Host "----------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "[PR #$num] $branch - Ngay: $cDate" -ForegroundColor Yellow
        Write-Host "  + Tao nhanh: $branch" -ForegroundColor Cyan
        git checkout -b "$branch"
        
        foreach ($f in $task.Files) {
            git add "$f"
        }
        
        $env:GIT_AUTHOR_DATE = $cDate
        $env:GIT_COMMITTER_DATE = $cDate
        git commit -m "$title"
        
        Write-Host "  + Merge Pull Request #$num vao main ($mDate)..." -ForegroundColor Green
        git checkout main
        $env:GIT_AUTHOR_DATE = $mDate
        $env:GIT_COMMITTER_DATE = $mDate
        git merge --no-ff "$branch" -m "Merge pull request #$num from $Owner/$branch`n`n$title"
    }

    Write-Host ""
    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host "   DA HOAN TAT: SUON CODE + 7 PULL REQUESTS MERGE VAO MAIN!" -ForegroundColor Cyan
    Write-Host "======================================================================" -ForegroundColor Cyan
    git log --graph --oneline --decorate -n 16

    Write-Host ""
    Write-Host "Tien hanh push main va tat ca cac feature branch len GitHub..." -ForegroundColor Cyan
    git push -u origin main --force
    git push origin --all --force

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "[THANH CONG] Da push toan bo nhanh va PR merge history len GitHub!" -ForegroundColor Green
        Write-Host "Kiem tra tai: $RepoUrl" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "[CHU Y] Lenh push can thong tin xac thuc GitHub." -ForegroundColor Yellow
        Write-Host "Sau khi dang nhap trinh duyet hoac nhap PAT, chay: git push -u origin main --force" -ForegroundColor Yellow
    }
}
elseif ($choice -eq "2") {
    Write-Host ""
    Write-Host "=== DANG CHAY CHE DO 2: PUSH SUON CODE -> TAO PR THAT QUA GITHUB API -> TU DONG MERGE ===" -ForegroundColor Cyan
    Write-Host ""
    
    # 1. Push suon code len origin main truoc
    Write-Host "Dang push nhanh main (suon code) len remote..." -ForegroundColor Cyan
    git push -u origin main --force

    # 2. Lan luot tao branch -> push branch -> tao PR qua API -> merge PR qua API
    foreach ($task in $prTasks) {
        $num = $task.PrNumber
        $branch = $task.Branch
        $title = $task.Title
        $cDate = $task.CommitDate
        $mDate = $task.MergeDate
        
        Write-Host ""
        Write-Host "----------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "[PR #$num] Dang xu ly $branch (Commit Date: $cDate)..." -ForegroundColor Yellow
        git checkout main
        git checkout -b "$branch"
        foreach ($f in $task.Files) { git add "$f" }
        $env:GIT_AUTHOR_DATE = $cDate
        $env:GIT_COMMITTER_DATE = $cDate
        git commit -m "$title"
        
        Write-Host "  + Dang push nhanh $branch len GitHub..." -ForegroundColor Cyan
        git push origin "$branch" --force
        
        Write-Host "  + Dang goi GitHub API tao Pull Request..." -ForegroundColor Cyan
        $headers = @{
            "Authorization" = "Bearer $githubToken"
            "Accept"        = "application/vnd.github.v3+json"
            "User-Agent"    = "PowerShell-Script"
        }
        $prBody = @{
            title = "$title"
            head  = "$branch"
            base  = "main"
            body  = "Pull Request cho tinh nang: $title`nHoan thanh: $cDate"
        } | ConvertTo-Json
        
        try {
            $prResponse = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$RepoName/pulls" -Method Post -Headers $headers -Body $prBody
            $createdPrNumber = $prResponse.number
            Write-Host "  [OK] Da tao Pull Request #$createdPrNumber tren GitHub!" -ForegroundColor Green
            
            Start-Sleep -Seconds 2
            
            Write-Host "  + Dang goi GitHub API tu dong Merge PR #$createdPrNumber vao main..." -ForegroundColor Cyan
            $mergeBody = @{
                commit_title = "Merge pull request #$createdPrNumber from $Owner/$branch"
                merge_method = "merge"
            } | ConvertTo-Json
            
            $mergeResponse = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$RepoName/pulls/$createdPrNumber/merge" -Method Put -Headers $headers -Body $mergeBody
            Write-Host "  [OK] Da tu dong Merge PR #$createdPrNumber thanh cong!" -ForegroundColor Green
            
            git checkout main
            git pull origin main
        }
        catch {
            Write-Host "  [LOI GITHUB API] $_" -ForegroundColor Red
            Write-Host "  Dang thuc hien merge fallback bang Git local..." -ForegroundColor Yellow
            git checkout main
            $env:GIT_AUTHOR_DATE = $mDate
            $env:GIT_COMMITTER_DATE = $mDate
            git merge --no-ff "$branch" -m "Merge pull request #$num from $Owner/$branch`n`n$title"
            git push origin main
        }
    }
    
    Write-Host ""
    Write-Host "[HOAN TAT] Toan bo cac Pull Request da duoc tao va merge vao main tren GitHub!" -ForegroundColor Green
}
