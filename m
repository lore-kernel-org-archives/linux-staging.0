Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E28C2C6;
	Sat, 17 May 2025 00:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442696; cv=none; b=P/VGZMXRzSmSs6Kk110T16n9cturNFAnbGRcS4nn2vfRuRhurIIngZXeaTaWjydOdE8pcHp/XBDLKNOdGoCUcHFpmL3Z6ua8Y7Bu+GGBDfd9MUJ6coqOyeCCu5PzpKn6ZxLxBpXBdeKFtrXCpCvhv9t8Lyt3ZkLNPq53yUo0E0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442696; c=relaxed/simple;
	bh=/+by3nXhLDhd4Fn1kND0TF0mFnJF6MSO/SS5g1gaZ1c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=caQgblJzCcb7afX+5pG5i4ZSOgGqBbwXAENyQ1fUynkxRcwPsRKNK8E2xNBB0k7vtKc4cEHFO9/Ptcfo5som4UkW8eZqjKiWp9Rjzh8bfHU/Zmw2G8b8XLjeFbNQfrtCR6BI8IYCTvURWQrrX9OjtQiUW6fOunXNkskeix9tgVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkSVhwVm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkSVhwVm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso339850f8f.1;
        Fri, 16 May 2025 17:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747442692; x=1748047492; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFi3hXb3LnVeh0HTaO/tFr2ZpFuhWH1qSxdp9khZGqY=;
        b=LkSVhwVmh2mEpm0lyBg2Am6cvQE7W86/qBDbg1XmhhiMGDzSNDXLR/w7kPpib2O/4O
         ui00zXNXhHPaY7LbzpCUzjCyJdo0elV2WXXT+/6IP+A1Bm2myAlmmS2o5MehyPEZvyj7
         NGSibfq7DfNZnGx90is5GYgWNhSaAjshocj7umq7BsMBKrjJ4O8vRERbmPU35InvIThj
         psa3c0WehGanieOk1lB4jF92TSQ32oqZCWTMORXXLL2Z8lXOIvpIDEnt+qOqi/pP9IFI
         orccQz0IVj0OdGl/uuJ9ujmMCJIIu10xBDN/NdAwk59jwtRByUCpjCdLzio6wbgrDAIr
         zZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442692; x=1748047492;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFi3hXb3LnVeh0HTaO/tFr2ZpFuhWH1qSxdp9khZGqY=;
        b=wcoo0WCRfZQbAfEOUfrm/Alb3Lv9T3qTsXKUXTMSYRJfIGeZHKZwnPk+PFlPIZ7v2N
         4TPiOGFPtg8nQJsGmFPF3MgqVDJOWYXJBrjq2T+tq7l+DrWiqMdsrzaKOoFhwsIAQgSt
         lt3wMbW1r0x29GZG/Dfev147Dq0Bj0qoMNQ6AhlJSHpe/AG3z/u9uHemC/NeTDVzVTul
         v285v08XPFiTquxjincyhPIf7KHUuY5S0yOqhOzFBNcdetf6Tfa4dcXYRrxwYlVOSdRJ
         mtJC/VQX4GbGg1BlJnH11vsM4MrcvEjgbwlUhWMQwwAfNOnCr1+OXtiRPjHR0FKxrNsK
         aAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEHCffT/WEFHVIC0h3vXrwSkFTvbeBWzLnkjqE2T63PC/0s/KajemXXBe/1smw7NudXy7dD0TWV6K3MGuB@lists.linux.dev, AJvYcCUWlDYS8zuCjJNvqTJMj/QDPs1cr8ZVGsaF4LE6iBI/DUQ1Fok+ISO/2DRrfs9lvSj28QD+sJ6dvKJ3@lists.linux.dev
X-Gm-Message-State: AOJu0YwVnqxI9L++1COgpz1ljShBOK+/pqu+tbKi9g+bcGjoAzU3oLfr
	YuG5qHp5deuaYVhUQdZqPxBy84O3EhBi9bRyS8aLfh/1nRAmyql29b+MkP+f+DCgaJxbiw==
X-Gm-Gg: ASbGncvMV7koIhxvLul/E0eAiBa3hYfCEj2BLznHqCEtaGENuJ6KTSuTyk3LO7wZvK0
	K2LHPemGGA6Mwprpipt0buQjRVAKEmY3qveJL6tDna2G+63jfpsZx+f0caM7W5KnM1h2wugr6wp
	fJT+13tik0x004sRB4+zOXZKqR/RwRFqqGWXLRsS7EQLc66urP00ndy++FIc9zGYvfXrKR9pflM
	R8gIJPTz2c1Tekq2GB9VkYI7pUaCz5AzbKtA//UrvOqHWOmlNw7zF8eyQhcC6yAURF7/VDWmDik
	Ar1aN69NpUK0MNboSk4HgonM5yTxfVve+mVxLHpi4V3rCfzeTnB9G1Ive3AB0GH7vU6f4CwTA4W
	+r3G7CYpNi3SitMWGoo8jqQ8Fa0UN1VE=
X-Google-Smtp-Source: AGHT+IF7M0QjmcH5fM4rPfAaywYSX4Aye22dDXl+najl/T2IKNfDsnLuCvDvrs73TdZFi6lL5IR5JA==
X-Received: by 2002:a05:6000:4201:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a35c8450e1mr1882358f8f.10.1747442692288;
        Fri, 16 May 2025 17:44:52 -0700 (PDT)
Received: from milos-ThinkPad-T14-Gen-3 (global-184-11.n-1.net.cam.ac.uk. [131.111.184.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8896dsm4417289f8f.73.2025.05.16.17.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 17:44:51 -0700 (PDT)
Date: Sat, 17 May 2025 01:44:50 +0100
From: Milos <milospuric856@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Align next line to open parentheses in
 core/rtw_xmit.c
Message-ID: <aCfcAsM5OBo7HcOg@milos-ThinkPad-T14-Gen-3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parentheses

Signed-off-by: Milos <milospuric856@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026d58b4bd7f..8c6841f078b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -381,7 +381,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		while (true) {
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-				(padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
-- 
2.43.0

