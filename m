Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8F70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x4so9821885edd.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xoKptjN/Za3XCKnMQ3wvZT/Nd+Wkd5RNXWkMpHcIZ+w=;
        b=YZExNgbwoso7Bp2/1mQB1Tz2shjDe2Rn/aGNjYz66jyQuog08QQ3SvE1t884UrHuCX
         LIxducPDVfFjdayb+IBMwYEWUh5P2LLOKsxiO8JWcVU4rOWt7z/1FqP4WLfttVB2qVp9
         q5RMhNjpaS5PNx46u3HTUKcM8a+gNN28Cj8AbUzYw1LLaYbFFgF2VyE7WcA+b5fqmBMG
         7qKDIyI2+ZDiZT8J3v02C/1gJo/x9lHU3VfsvsLz+nytW6ls2ZzL63J0qxm4YYLtIOfc
         2Ev09/aYgTUywHk23OkoACZNxBGxLG3AxhQZ2TZxymOo6TA6e0pprRhLLxqiPscztkU4
         lYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xoKptjN/Za3XCKnMQ3wvZT/Nd+Wkd5RNXWkMpHcIZ+w=;
        b=adI8gtzGF58ViZL5HZm2BnmHkfxEIZtAX+Ii5jbM5gYtjsg+hbuDXmAlqyHPuDRAor
         iQmbDeTIIKngt25qAGCMYKMHfCLStqi/tcQwJ0KdA7EuR59id+orXkbjRaS7Ljd/vuk+
         CSsEcc+TW1KTAFn+hiNn2dr77s5ODJTRnuBu41SN9In9TI5pNtiCahuWM36exd691L68
         1YB2QmugSdgN1UlRfjpAZabHWwc0Pxe5WtKmV/Cyob4P+staBEr/ZTakTdb0VDLO0Ku0
         XB0BOZ1muvDK8+Y9eTdLipWKMdVubHyelYTv6aGd5Kx/+X10ppCxmWgVrtc+V+auFoda
         tssw==
X-Gm-Message-State: AOAM530L2xjaEBP8Rgu5ImqN8ko4N/7gz6LBY/Fa0TZkV/WcXAl9b7eN
	n7QBjWOdbeeEuy0P+Zkks1E=
X-Google-Smtp-Source: ABdhPJyOgubwmg8SV/6/RhhVIhx9lXF2zGvuasrzaa50+idIH+PCGmnOfzDwSOHJT0nUkIBj055S0A==
X-Received: by 2002:a05:6402:549:: with SMTP id i9mr22547270edx.379.1618064468862;
        Sat, 10 Apr 2021 07:21:08 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id lj21sm629253ejb.74.2021.04.10.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/25] staging: rtl8723bs: put constant on the right side of the test
Date: Sat, 10 Apr 2021 16:20:31 +0200
Message-Id: <e19cff736413714dea4265c17b512882d051a311.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checpatch issues:

WARNING: Comparisons should place the constant on the right side of the test
287: FILE: drivers/staging/rtl8723bs/hal/sdio_halinit.c:738:
+	if (_SUCCESS != ret)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index d0606267d947..049112a08776 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -735,7 +735,7 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  init LLT after tx buffer boundary is defined */
 	ret = rtl8723b_InitLLTTable(padapter);
-	if (_SUCCESS != ret)
+	if (ret != _SUCCESS)
 		return _FAIL;
 
 	/*  */
-- 
2.20.1

