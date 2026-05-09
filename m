Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10C2475E3
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778302332; cv=none; b=Xd4P4TNgXA0iuE/eL+tPwb64DU27FuBZpSSJ7id6ZwdAGi/4rhM9iHUFFJAFrjQ5CWD3SrC21CqwoimibrqoXSyxbOGSA0FVS0WUDC7oARaNZBOJxyMcwKB+AMxT+3LSthuAceWGRMlrZBOixoMh5J1vwHHZe67Rj8YuMCepM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778302332; c=relaxed/simple;
	bh=Q4BR2ZuaJV4AUeB+ZvFfKRqisn1BMfoyFzVeZPnUH48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQLbwEij9eAgNyclHITzEL7z8qNYFAN+jKikpOm5y7u1GPIC1e/lZ93wVGgBG7Qoq81fGYB5pTuSHybo4vv+eHL066lyicUfcN99dC+IDHOsDnyTKpRQUXmu1qywzZ9old2/o+QeZ24QoJjmqHXKmZHc9kyErPNIIoiyVQZRkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLAB7oG5; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLAB7oG5"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1309f4ee973so3139018c88.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 21:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778302330; x=1778907130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rc857zTzemj1PMd0Crmjbc6UXE77ukEwOSvnNl9C8P8=;
        b=YLAB7oG54VQGtSeC5U+Mw9jE4QogbjFxq5djfcEiZ10oc4Y26l4dxzLhHzKexGPrnF
         CNMCPJlXXcv5n8FxCJfY8Mdtkpisaw1QYdDmPBXqS+x75fkQGvIJP5mbA9+emy2qHwgo
         zoW0dkX51RuEJ6kSwTxA+HxBrIUpFGitZ2W6qWzLuTF6ARHp8nKdkUGJQVu6Q2eZD6px
         aEtmJtwkmtTTwHG+MD+W/TR98NmL0KDd5VARCJYcmOTl+VxuaijxRtJUpEMTGQdKLIgG
         YPxGje4x2WfmSEOn3p8xD5TLh1PjdXZ8Zv2RwATrCcnfgQz7zbzk6c1a5cWtEuVWcQeu
         Ge2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778302330; x=1778907130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rc857zTzemj1PMd0Crmjbc6UXE77ukEwOSvnNl9C8P8=;
        b=RFjc+Ti60OMlx70NgtCZbGQiPUqOFJAiGaarso5d5EYpJryVRN65HxkIbFgnEeheYv
         pr+BsrqYyQEjKAsvtFhAXa+CFvAwO1H3DhdFvNHWv9UMLjuSYTVGIDIG0JBnOtftimhD
         DTuC4FjNNdrDXy0+s1RnXnP/VJj8EvCnsVD7MOlxS46T7s7pekQrPJlyiNgkTyowivhl
         sGHSE4cHPpTjQa9xFfpYTmvAT8CuVdiVbo2MgzzPME3vwlzlCpIV7tSuHdZFGZTSl9v8
         nGxKhDopR7i03g8yCVQWtWFlLsnXHbPpyTArMaHnoKwkf0SxzPUBDoVvLdxsAwv9Wjey
         GdiA==
X-Gm-Message-State: AOJu0Yy1EzARpZ5rliRqZMM4iEpaQg2xuu4EL7lDhgsEI/9ePmFZ0oO+
	zl30kdjBJ9yZfaYQ/qfwWPzKNt5FohobeqBmi6Ab+dtRIzX8E+uhyoVZXzb4sw==
X-Gm-Gg: AeBDietUBe/aqkRXl/LGx5ScihMJphCQevL07DMvWIXzcopPQvK/LgKkc5A/y8qKOxs
	3s9oon9lvmmbq7mgewOLGxx9ssStTjDtZOTLaaYY/U+jPFqoH6g4NJk95m3/beFxyyJHq+F6TnA
	SfUx+GAMST4ZUKQ6npNAytFne9nGCbUoi8+3uudvpsqVZWc3fMFgUWvWVcmTMVCsOgfaitTbyjs
	3UACDigQ04ALXPvCCZD1uXsR0d6aVzBZAbkZe7SGrNWNtExijEvanB8eNri0OCu3V6jDQH91TUt
	mZdoCtK+KnuvhtKw+frw8gL79ZgLtXtqxk+hZP1+jWbn3MS2IbdSM14DoHJK2WlTrcKkHP72403
	xcQ3Z5fF2r0aliG05e35+zvyfiQgAiwi96hqRULnjj9kGxExZwOmyRjwxGspdMcnkyqT+/mwRhf
	jJwn5NaRLpQNZczikCgnn1Hsibjw4i9e3xAtaa5VJEJmU=
X-Received: by 2002:a05:7022:b9c:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-132a84f8864mr523279c88.30.1778302329755;
        Fri, 08 May 2026 21:52:09 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-132787673ffsm6416749c88.15.2026.05.08.21.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 21:52:09 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary block comment
Date: Fri,  8 May 2026 21:52:00 -0700
Message-Id: <20260509045200.5050-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out macro definition code from odm_interface.h
As far as I can tell, this block comment is no longer useful.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
Changes in v2: updated commit description.

 drivers/staging/rtl8723bs/hal/odm_interface.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index 400473ca58ca..c3b13f5f37db 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -18,14 +18,6 @@
 #define _bit_all(_name)			BIT_##_name
 #define _bit_ic(_name, _ic)		BIT_##_name##_ic
 
-/*===================================
-
-#define ODM_REG_DIG_11N		0xC50
-#define ODM_REG_DIG_11AC	0xDDD
-
-ODM_REG(DIG)
-=====================================*/
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
 
-- 
2.34.1

