Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646432882C6
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170089; cv=none; b=DTw0UBMgyAkpU31hOZKBm+6wXQ22tc1xaPZXvBOzPS1+7nqGGcsPrF8eGkeYLWIDPdgetDvef4VkfRdceJiMgIUkwVauRw88FXlGYbWnkV9m2uCyEICIm7pynG0hNrPrvKV3Iu4q3j/mTGx3wSmiORnnZeeEVnD8Xhn2iJ8MSZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170089; c=relaxed/simple;
	bh=rtRC4Ev3m/O8U1vK5Biqqwhz/fsXnQUBT200dVjZ+Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJDO3rkyfdT3ijeP7PulFF6Z8EqQEtAfoZ0cHoLew61yVLxR4/92cj2ZKMbVzgT0Lks54rIIfdE9Db/wNgKztZY36h/x6ySgfnHhAyqg1Ve6W85HvNSntkzY1IQasInkVDHzgMomJjBXnEH+z0PfaFt5z+S4r7oOdRylrlbjC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pzrz/ZlN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pzrz/ZlN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-612b34ef0c2so8814321a12.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170086; x=1753774886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD+WDAZpBhywuFmsykKhAgacOLRRprRh6YgpDRi2+z4=;
        b=Pzrz/ZlN+tnZHRtmiMPXcBdjTVkSeAIkNMBqBn91SkIDzMPEaBKrVZGm+99SRE5E6D
         G/60u64Am6GHzJL1WieL6kYAeY0uS4i9xsu0l/YFa2A3TRffjMmqZPw3cDSEfsjQvDf7
         aNUUGzP1wkVehUZ8f0YiSgiFz31AH4F2+xvt4WLfCfC7IxKWhJas3UeG2kln8SV+6BJ0
         GkodukzeBQ38JfwaKQGNCxNtraWgjWtOFAKBsoh1tMiOSlyZJBj0lPVyPUB5CODL9Egt
         ZETKgLGB+QT3NaESjEioi/jJjdTp3RTb6Z+qx/UjmL4aESD/k0VgouOl4nPH9FiAQnOS
         Gk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170086; x=1753774886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD+WDAZpBhywuFmsykKhAgacOLRRprRh6YgpDRi2+z4=;
        b=IVq1tUgslagBpBxfplMgywxlAY1wERa43d8YxCubp+c7uw5UrNMXaMBtz9V+O4qaS7
         T+nNESTR5bseaLVhl/yh4vkyn3KOMd4O2KVf/98Aaz0EBJW4mYN/knGLKAcSnIf+6YxQ
         wuVFcBc3fmri7jrLck2cfHX2Wejxy3H8UriZ1VfqW8mug/ZJacferRRz+qHHl4b+f66l
         ebTeuQoXlctU17JK53QDUhv1imk++3yxj2cpVsNM0jIO0zWyCGM5SKmdDwYeusVNwRDo
         Pv3B3jHbuKLEntp8mweud34oCBEFPKZbua6JiXZI8Ib7Qx6IDg67rZ2JyIttbFwkgQlA
         gvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY1p3RlAq7JKRjNdQCCwp22DJk96unFZv+TILxL+SDLtVcoK3/AiUjrNTH5ojxAnJj2bPMxMT7tMl92pOs@lists.linux.dev
X-Gm-Message-State: AOJu0YxJR9CvjoZAh3l1TOEATt1VILKd9pSO7f5OnfSAbxLxW/KJNSEK
	whxw+jWgsvkG++czBGwZzBfX28AgJlH2k2fYx5sOX4nUR6vWtY4jqQ2bm7I/yQ==
X-Gm-Gg: ASbGncsFOY0iNvXtEZ4nnayV//SGEMaSk/WXcKsdJMP5jgsmR8qdOJigfRMGye+rIyf
	aVVWd3tX4Pbfn6WQYojfE38HsUukLNN1u+xhru4iqayUZmpF17a7LYeYzRdSgC+1eNXPcIxzHg/
	hNEBhCXl/DnjhNLkE25BYynkPXRj49goluG8vhCKU/jgs/HRnpfAyy6/BiK/fDFN5r5j9kTd303
	1PY41/eeOezKBlp6BLpFLY9O7Y8BIO2Kj7G9AKwu8RYaYKdvGKVeSeZy/xEVUrhInXrh7HgSHZh
	aAwVIwHvz52JYuIt3RJnt3giUY5kiJjLpxkP03t1XVbvIOIp2VEwk0JnwrWE886o0OUubdclK3s
	BS+ZDcryrX4LIuT0TtZtP8F0=
X-Google-Smtp-Source: AGHT+IE7BkXfLIsvxlP1JCVlXpdU6K0hfAWqn/gXsklQoTqpQ23YZ2oC7vEcEUHa/9rB83DtWsLlwA==
X-Received: by 2002:a17:907:d89:b0:ae9:933d:f0de with SMTP id a640c23a62f3a-aec4fbee39amr2202987566b.36.1753170085549;
        Tue, 22 Jul 2025 00:41:25 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/7] staging: rtl8723bs: rtl8723b_set_FwAoacRsvdPage_cmd is empty
Date: Tue, 22 Jul 2025 09:41:10 +0200
Message-ID: <20250722074115.35044-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtl8723b_set_FwAoacRsvdPage_cmd is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 3c5d516cb3af..93b63a16b4e0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -300,10 +300,6 @@ static void rtl8723b_set_FwRsvdPage_cmd(struct adapter *padapter, struct rsvdpag
 	FillH2CCmd8723B(padapter, H2C_8723B_RSVD_PAGE, H2C_RSVDPAGE_LOC_LEN, u1H2CRsvdPageParm);
 }
 
-static void rtl8723b_set_FwAoacRsvdPage_cmd(struct adapter *padapter, struct rsvdpage_loc *rsvdpageloc)
-{
-}
-
 void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8 macid)
 {
 	u8 u1H2CMediaStatusRptParm[H2C_MEDIA_STATUS_RPT_LEN] = {0};
@@ -605,12 +601,9 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		dump_mgntframe_and_wait(padapter, pcmdframe, 100);
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		rtl8723b_set_FwRsvdPage_cmd(padapter, &RsvdPageLoc);
-		rtl8723b_set_FwAoacRsvdPage_cmd(padapter, &RsvdPageLoc);
-	} else {
-		rtl8723b_set_FwAoacRsvdPage_cmd(padapter, &RsvdPageLoc);
-	}
+
 	return;
 
 error:
@@ -876,7 +869,6 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 	dump_mgntframe_and_wait(padapter, pcmdframe, 100);
 
 	rtl8723b_set_FwRsvdPage_cmd(padapter, &RsvdPageLoc);
-	rtl8723b_set_FwAoacRsvdPage_cmd(padapter, &RsvdPageLoc);
 
 	return;
 
-- 
2.50.1

