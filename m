Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD83014E2F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790288; cv=none; b=qJ8AmeYhIwMQwb0axZVqzowjAYapYEKVK9zx9tVJgx9mn7gdwwETvHsto0XTDFdM7RVaf00nRYPVbUZVMFhdrQFjAjV7HuReXuTXQon5+5o8EhDK++KFE8v9DW2qXsS4c6/h8RXmcQbnb1b1J/BGneYKsaiwWoU2Tykw6Zw9Urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790288; c=relaxed/simple;
	bh=ZfsGGGDbjW9NU9Xyaf6CER8qH5KsnUL66JuoMyHNjZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HGXE3NbtouScK2Qd0Y14lE0AVVgpKQ+DXoUixkPfzoK/vC9m+a4NB3lkWmjvW+P7mV+1IZP+gl5W2nQRlk6as0je4fXNU8UOj6OJtaFOet9mdXKgrbA7wfyGaSfEYPo4wCnCxNdTWXdLaMqNQUALQDD69cfVduZJYuif8kpWyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTco40LT; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTco40LT"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-710de2712eeso349364a34.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790285; x=1726395085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gl8Z+gv7OuYv4fDWlpGtlGw52NOtDXPmfGSv0nC3Rco=;
        b=hTco40LTddqhMhjPaA5PLJbUTiq+ybPfm/p1zbRFla4G3HcZgdzQqfn0Ba+iIrcNba
         1L35n1dDuhcY0Zr5keN1/vsFXJoBqMCq7yuhUX5v32VYZjjWncXZjG+kpwodnW98En1t
         I7iDIhvDFUg+X0jv+yLocqFU88V11iwF4w3fIciLBFGxiPjHAydKXx9duD6VZA2Ei8yt
         CJmIdsy1sKiU64VQ/FeTALis7qb3eiEOxoJ/ONxU/NamehaGfLiCUnCxJbeapNo7ccdO
         5lEh8NbvxlRA2jpXQflSmtIIvjJ2S3T8EOLGngIrJeNo7TedssLOkLpUICEh9vKzDHix
         zSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790285; x=1726395085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gl8Z+gv7OuYv4fDWlpGtlGw52NOtDXPmfGSv0nC3Rco=;
        b=k6bOKtQ2Z8WZVPqyaJLjZv1kNiQNhAhp+7UZ4wsHyrZMlTET/W6dVHcvXiHEWIL8/K
         jS6BNQq+N2Tlz3jhPAS1BpNONajCJJCJm5FuAVngBHNNkJuI7NRFSKg61Eo0OjJtZZW2
         I868Vali1EAiUq9JK3VMzFsL0TOkLNefupLPI1l/sm266dY/DV1kMUv2RRZhtFHxASya
         xz5bCu0IH7xXEBYWB0WbRKQQLUlJ0X3lCufFUHpFCfdGA+BF4421naCCvIYxqP1NhAMd
         TL8R0SU1pkoi4aoBJQHZqwxn2W7BG3UgERPpESEOpYzyr8Dhyfm7ZGwN7Nu1ea4srhQh
         +IFg==
X-Gm-Message-State: AOJu0YxEOnmgTsDVehvw+nqe0NKHzfCl/oo0Otvc/PHXcLekuNB7ebOM
	yT7pxHz7a483oG6FiVhebQN5fbh881F0bH2Clfesgvk6tkKFI7TYFgECfoCZvSQ=
X-Google-Smtp-Source: AGHT+IGDRXfL5Rxje2ZS0pH0f6MX1/MypbBV2EBxSOIxd8qQfmbHsxHX1GPpjXyGTXEa9xaXWaDl5Q==
X-Received: by 2002:a05:6830:6e8f:b0:709:3a05:36c9 with SMTP id 46e09a7af769-710d5d06391mr5984332a34.29.1725790285658;
        Sun, 08 Sep 2024 03:11:25 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:25 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 2/6] staging: rtl8723bs: fix position of opening braces
Date: Sun,  8 Sep 2024 15:41:06 +0530
Message-Id: <20240908101110.1028931-3-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the coding style issue of opening bracket "{" being on
the next line.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 drivers/staging/rtl8723bs/include/rtw_security.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 487d69460cec..3ccbccf92417 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -170,8 +170,7 @@ struct security_priv {
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
-	switch (psecuritypriv->dot11AuthAlgrthm)\
-	{\
+	switch (psecuritypriv->dot11AuthAlgrthm) {\
 		case dot11AuthAlgrthm_Open:\
 		case dot11AuthAlgrthm_Shared:\
 		case dot11AuthAlgrthm_Auto:\
@@ -191,8 +190,7 @@ do {\
 
 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
-	switch (encrypt)\
-	{\
+	switch (encrypt) {\
 		case _WEP40_:\
 		case _WEP104_:\
 			iv_len = 4;\
-- 
2.39.2

