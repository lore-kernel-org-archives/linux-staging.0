Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AF1A23A0
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899320; cv=none; b=rZ0m9miVZEyai1IlIHyoogewWXOJWVxsYaFuDrJ6gfpa0+Lb/X9Ll9qZVkAEaf5iZSH/XFl5ucXOOC1gaBylV9kkngXzyPjkXL0T5j8RZbvEcUaq9Q5xZapCGx7WO6MZweNqh5QXGB71TqFb3MPnGKi0LQiZLIMLqRp8eCWhg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899320; c=relaxed/simple;
	bh=cQnU70bPXJXkLxx0sRXKMGtImAcagFHJMRGvq4dsxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpLmY515pjlTSWE5BYMHxqgmh+sExBNwnuqCOxoDVzF03/GG9awSuqIIvOcYcGKJ5j6vfzTneuf0J18SeOZTBkxzJlH5becG10C/BU1gi2SHRtLfTjK4SMmpku6NYMnRhJPh6kD6Gn67Ul2CGTfKIKVf+Xwo7JL7PywrXDU/3bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuxreXLf; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuxreXLf"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9a398bc7so9528476d50.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772899318; x=1773504118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAQ5M0wNguH16SQN/Avzs9OPOCF5WrEpnyeX73CWSJ0=;
        b=FuxreXLf483VcTVz/qiR1Ry5L6kd4GgDa5ZRkXoczAKV7/addSb9HL/Eg4krfVkhSj
         1eFOPoS/ypWgG2yG2IHYShqHAy/85wq1//NgvB8pnTULk8zMcrufqfEtzdPQt3llqwVI
         0Q3FfYvdAYvRf5KUr7YGQv0aTRXh5q2tXzM6A8ZY9cbKy2BR4pI9OE/3zneOY1DVkO6Z
         2eOC+oG71EI52EojftxxvQfjbQQRWECD2d2rcVz54KrmtvoQupL8C32LNdcPRf1tp3qi
         jJsPWsR3f3SDshLlB+GQ8f3LONz4KpFGMZpAoXVQTsX7vUgcCGCr6atEPisvg8fhDcNo
         hSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772899318; x=1773504118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAQ5M0wNguH16SQN/Avzs9OPOCF5WrEpnyeX73CWSJ0=;
        b=OzlplGj/Q83HSXi86J/vI0eqJKv1TsViBlKNEMKebv5lhsDch7T1E8y4EZtAK5+Wdj
         taCg6fIJauMzCUD6a/SsTGlwvtWd8Wgi6HRoLIscnrHDFMwQYV9IdHhcDCFYPSiSczW8
         b0DGGO2ubHF9maCIx9RjznMRGwJVJl+Ps6l9TADiQrSO8MFWSd2PZhNzcfjitWoGd1l0
         cDpm5jxoWIOdylbRL/dlGYRzNjPULBOz/n+EDwE6m2sZHIs++5wLGLqmvrZwy6jw++PQ
         m6Z+6yPC54maWdjJfGWIWNlG8UvUnnZiyctmNg672CcGW7zNATvFmahFZyXBJh65tZUT
         2acQ==
X-Gm-Message-State: AOJu0YyMaPxpC3cFh3LRiUSTN13sfLSYZ5ErbuHzI7LgCQ93MCRfQrxX
	7j35Sl2DWXsnQgogZc/YKHSEgfS02boIUjqfU8RVDZDi8XSaFhaPKruJ
X-Gm-Gg: ATEYQzx2NpuOnFio8XCDzbcPX19Qh2GckmslLrOiJxwR2giC9gU8peh5Gy91MtZwXN+
	gwJ1mwqfFmJszVPlXblye9H6b3nQMZGpPAjcM9RWm4T5wLS+qWDxSm7gUcuX0gzoQgvhL6wk/D0
	wuq3rREvG6ELlzfBftI64yhXEd0vFGeD895xw6Et+dJusTcvKQbL165npfiEuQQcxgNb5ZYQjjF
	n3/KEjENV6fGb8XBlAZHVJRpsY4rH/OhCl9cb9Bl6tvd5PJklN2E8zund//LDmOh56k9+7Bx4kM
	G33e2dg9C7Ge0qwcLy7/0X9GottxAoWFicc+4mdMYqyb2famJPxBJKtE2ZqsGNISJVBrT8n2piM
	E2DzV2gKBRKLd5o1xLhAS3OJoyvvd5LYVb8fnK2fC5YOnz5FRj5bCgpPmtWcMoRD5iAHxS9lohW
	UD1YYsFT6EYA6kNm7frYzrSU2F
X-Received: by 2002:a05:690e:b4e:b0:649:f0e5:fab1 with SMTP id 956f58d0204a3-64d14102078mr5600505d50.23.1772899316649;
        Sat, 07 Mar 2026 08:01:56 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm2232160d50.5.2026.03.07.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:01:56 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: replace rtw_linked_check() return type to bool
Date: Sat,  7 Mar 2026 18:58:33 +0300
Message-ID: <20260307160024.18039-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307160024.18039-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_linked_check() always return 'bool' value, but it's type
'int'. Replace 'int' with 'bool' to make it more accurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a8ca69260ae7..07be7980c1b2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2589,7 +2589,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	}
 }
 
-signed int rtw_linked_check(struct adapter *padapter)
+bool rtw_linked_check(struct adapter *padapter)
 {
 	if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) ||
 	    check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 9ead083e6b95..ac3ba746b64c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -364,7 +364,7 @@ extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8
 
 bool rtw_if_up(struct adapter *padapter);
 
-signed int rtw_linked_check(struct adapter *padapter);
+bool rtw_linked_check(struct adapter *padapter);
 
 u8 *rtw_get_capability_from_ie(u8 *ie);
 u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
-- 
2.53.0

