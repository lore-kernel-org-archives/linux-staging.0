Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227DE32573F
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779613123; cv=none; b=MjC7I3iStWSda6xhDPk50KcaMetPgq9thL5pTtY+p72DcDIr9Jduw2Rn5I3u0RFMJzgOeTh55v9GdbmO+xb9vOR9g0gENNguNsKaIxj7/JNr3uDEwCLhAHjsirv+9ZdzqsWFVjI99zy9dx0IIt3USnHqDqlyVXhREWOAa36cujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779613123; c=relaxed/simple;
	bh=0p18Xmw3TpjsWoKjtrsDWcq2OKTySNbGi/bAO8nGkx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrc5fmQXqsjetUWwZGlaowT4m+WDqsJSrVM3oh35Bmzgq4pmaTkfQb/ItWfuepBRN1JKbRdUL6gUxCwdF1QuEE/9pxPY8AlzR2MA4h7dibTRBiO4xxJ7AX/wjdBQveQ76dKjhnvbMklJVeBsHDVAz3s6wANn+1PHxH+bRBocVR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZhzNkCo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZhzNkCo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-834f1075805so6760111b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779613121; x=1780217921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zew9qEEp5bPF32ignC0zdUa575Rx6JJCDC4UsgxOOg=;
        b=rZhzNkCowfddvYWsbRyz4YzVglIn3C6ptY1JaYzKJH5/bQsL5xJ+DLNTxaRllYtcbE
         U+4NF96avZz3WFyGuJcZlqkMmOQEGp1ZnRe6cB+1+AMgr44glxNW0Hlkr0edejvP6xQV
         UCeHMH6vMpDRVQ0dePbTlvMQffyLsWl2f1IO6ZQx89u8zpLDhZTz8gRKY0XVly9zPS/w
         QYBQ9n/hZ160YHpo4lSccDNDKo6bajwIhAbBX5RSciYnhUWfX3WgyeUQuwwYmuDmT12E
         K9C3qRedoKWhehqBAQxUp5uRRc86vtoWqlqOnz4OcyJJbVYfWKQMf99o80gALYfgH4p6
         9mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779613121; x=1780217921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zew9qEEp5bPF32ignC0zdUa575Rx6JJCDC4UsgxOOg=;
        b=EcGmSpnD3Ay8KrfsI8pM+lXAXlhV9UTlBATFFgYTe2Xx5hxlgCEtP28/8gOWx3GivJ
         r68HHdc75lSAzQpHZecabvERSW+OOrkU9qn2Uqy/cK/9G/sukaYKg+EhOmEu1d0D3s/d
         msoU0q428ZLpcYyOvDRnRzpFlecChc8vSUIX1KK+SVjVZk8+NEKCy0LN38HJqnUysXx/
         qtaEe9XmqsTXwdIXmldYQxLxCfZjtbbSgYdYPJpckX+JLp2/UBjCOLHZO1GqPlROC80C
         BgIMc1Itu4U/oCkju/mRjt1fpXGVC9uDCHWUTNhupicv8Bf8ut4VdNOiWNeWhigo2Nh7
         l0xw==
X-Forwarded-Encrypted: i=1; AFNElJ/yOiC0oSyhcTpynFTls3iTxTj4Ogr2R37QqMMfP7WOWqfjqwaSZEOu3EvEt1HCfgqjj++A9TFTE8mC7bDQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwlucglW7BWCM3y/MYPGieJ0XnujcoAUSNaG53ji4U9ndQWxQ2N
	l7gNJGy3C/g4SEnHQrYwX++kToGNa0PIQJ9WosajSeOs7eJ2+H/HVM3v
X-Gm-Gg: Acq92OEPr2BLpDXCwnAyIXAbPmeOyAQea0rx9xDsgNgNgCL8uqVgfN1cW0NhTSVM7AJ
	BRg8tplYFvV+lGvzhl0Wc7cmOwnb58JvG11QjY6SIrsCCRyB5VMIf9i4C289osJmq50BLgn4WdQ
	8GCIbDD34CLYPwWmN5A+S+scy7x2eiEaCUYP3+p2Nearyi7BVRhc+CYuVB76BlidnNQcNYDJtqR
	4LH2eRw23HcvHCj9xa5RkazbeYGuEsbVi1JTzFv95gYMUw+Rvuq1w9AKmjgNsE2v6/2uFldT0Jb
	nrh5pPXFWwxXmBwTSIAI1KP5r8+1jrVpHCJeDQpUu5JZfm+QA5Y0AAbO+V2zreHF/uOIdlevp6U
	bujOuCL0KmnO7WCa0eOWpeqnB5TBqbnjT1qksmF0MLLeJiHs6kid6+sCB2xWDo1cTOmNSzIgQGw
	jH9xR9K6fAhfC6AFSL+Uo2rMarYKhPRbO1l1rD4Dw=
X-Received: by 2002:a05:6a00:4299:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-8415f0f0cfamr9680699b3a.1.1779613121551;
        Sun, 24 May 2026 01:58:41 -0700 (PDT)
Received: from fedora ([49.37.171.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea0634sm7414875b3a.29.2026.05.24.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:58:41 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Remove unnecessary blank line in hal_intf.c
Date: Sun, 24 May 2026 14:27:32 +0530
Message-ID: <20260524085732.20153-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines that violate kernel coding style.
Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..6b433ac72d14 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -264,7 +264,6 @@ void beacon_timing_control(struct adapter *padapter)
 	rtl8723b_SetBeaconRelatedRegisters(padapter);
 }
 
-
 s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
 {
 	return rtl8723bs_xmit_buf_handler(padapter);
-- 
2.54.0

