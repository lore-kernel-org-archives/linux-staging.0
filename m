Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A73988F9
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489381; cv=none; b=fqCER99VbAJvleRUG6QulWJ+96ayZXf/9g/7tcscaXBsqufKNLWpRHGpwaqTnJ0CN0akqQdXt2xx6wMeW4YuWtvWt4/6Je+iC00jhTXugoUtHwDjlGtuV2ZrEErjchIy6Q7oInJUmGZWLTBnY2IajHtLWCiaY0OLkzaDqiJ/TuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489381; c=relaxed/simple;
	bh=Cstg9Tn/KwBnwQwZthXsVyLc96Oiq8jwCupkL55xgc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+PIUkQkbvVaknLfuV6opDOdQG2HNXqOuf9qDF811Eo3RoKbnwRrllT0LvuD5anY+w90/jVRnpW5LRglrBIWJyKPitpCHqL7p78oQmuJwdPolepCPl4wkTEXD+K7lWqozHU8fXboWQtd2rGiRZmNgD7gg0XvDud6XEHrxO01l0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8NHnW2v; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8NHnW2v"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso292382137.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 18:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489380; x=1775094180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZnbVMirv8VDzglIV3UEReSG5jpGe65jGd9BsAEXnlc=;
        b=V8NHnW2vBp//krL0uOgq8gk4flIOf0fS15/kMXM5Sok6PjAis937hoqYA9pbN2a4p0
         QunvaoaXHuUT6q1KcLlmtkvTi3DykwfEwBg8/oxRjjj9WJd1uWneazrGZ2c8ZF2DPqaT
         hgZX1kpldBDzgxhcP8m7xk6pGnk8jABvQ+gKCA+UflSo6uHCHxmX2Fauj4jVYLuX+rZ1
         MHUF2zWlqIe/0I1oAqQhQ5v3Bw0BzL115iJdUH1vIkdr116QSD02DfFzPkYT/l79q0Ph
         c5Ze6ut07qQfLGiG4M4cieSni2D9AM40vbYCHlhvAm2092qb9vWSYnonfju2B+rHwMcL
         UTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489380; x=1775094180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZnbVMirv8VDzglIV3UEReSG5jpGe65jGd9BsAEXnlc=;
        b=KiM6JSWKT7BJTyhfBUOqWPCakVZuZk7Zoo+U4v2dxAhfiki7UBMSuDwO96YAmLK1CU
         snwXGOAWW5lWzeUlAKhqwq5+YJq2PJAcj7jjI71p6tOi0bab8l8ytbd3MCfILOJbGG8n
         Z/P2GNr5GMurTxGQL3TrbnahdNZzTyEf9CKaYVEqB/Q6cPpR/SIp4VqBpNDOJx1qWaw6
         Phxd4qAuohmxcIZfhUSiEoh1C7p/QbNLX5wrBAC9vBMTsIIzIe3xtUhWeqUzSgNz1z9U
         8FWE2Le1noFIVqlM0+X5wTCas5+PJ0e1wguw3TVTrgwKfChGIt9yXN7POEE49Ajie+L3
         pywg==
X-Gm-Message-State: AOJu0Yy1CO7XYYGWLuMyN2yt6GFn/M5KPcomqxSnma49A+set8hGVwh6
	VvTjZaoulARG4CXrbaiHbhkLsHNYl05pJ42/lJPMof5DYMFkLg549/u/
X-Gm-Gg: ATEYQzz21E1u+VHyGHlwp78Z2cMzJ19mMziNGHNVr9GRUPIrCf87X+Bb0jtDyY53s6V
	ucA+cNj/G3t80ecd9AvjlL8Y20VRZ39q6id3uAcxSgyW12lsxc0BJxKnq7PGGzjzd27xtf/kyjQ
	gNqo1bvY9fpEF31NXcxmzC6jWY0ZuV36B5071rSRQ7BFgW9G0R+l441cXRVBi2JK7GhUBLhmuXw
	j8GwEgVDqPZIRu/JNB+fK1tjYPMaUeg674CTWmzv/kXRbGGI0OuGXrHmoVVbhd+SamnhLy5kbe1
	xQXPxQZXzcOVU9Gip9waTNoekwDx8LyRuhAeg1b6ODxuEIQHk/GlL5NgOeN73B1vuThoP07j1wY
	iTn1pupHeJb4crImIECUgkmZQ6dF/qUAWPRSK8Hk7ehSzcy294yjp/HOPz7JXtTKbF2UVYJvqHi
	J5KESR40xgB2CyRnpPwN44ZnsalZfAsuMz8kRUfxz2yGGUAj8M3CqBbucoMVfG1x+WQnE66XpW1
	zjI0U8EDiG+mCQGt4o=
X-Received: by 2002:a05:6102:26c9:b0:603:273f:3570 with SMTP id ada2fe7eead31-60385f6e8dbmr3181732137.15.1774489379703;
        Wed, 25 Mar 2026 18:42:59 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.187])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm1661643137.5.2026.03.25.18.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:42:59 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix coding style issues in core:rtw_wlan_util.c
Date: Thu, 26 Mar 2026 01:42:20 +0000
Message-ID: <20260326014221.525368-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326014221.525368-1-marcosandrade95963@gmail.com>
References: <20260326014221.525368-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'enable' parameter in Switch_DM_Func() is of type u8. Explicitly
comparing it to 'true' (which evaluates to 1) is error-prone. If the
function is ever called with any non-zero value other than 1, the
condition will evaluate to false, incorrectly clearing the hardware
register instead of setting it.

Evaluate the condition implicitly to ensure that any non-zero value
correctly triggers the set operation.

This change also resolves the following check reported by
checkpatch.pl.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da36c..41868dda3838 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 {
-	if (enable == true)
+	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
 	else
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
-- 
2.53.0

