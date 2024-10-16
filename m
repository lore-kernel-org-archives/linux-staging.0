Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2721B395B
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083403; cv=none; b=IZu6yn3eNgr2eM69HIWq5z02+fSYSr7tbpE13HcLfYoplzlf0/XI/LOFCfQb5uXgA/V1TRBa9P7EAyczopGhiP/IEAHWD8CUC7RHqcQBFoCO4cf0lJgPTd4+fi5Mfml94+c38TREPUiFEmiPm8PoncpirumwoRmVDZCVTExSMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083403; c=relaxed/simple;
	bh=1OACE3daHJ+YdaE0nxeFHkeGq0qYmXC3IRnKMrKDGew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GS7IVTsQJ1pQ9Wqvk3McGNbdNhg6zvV2GvgTAqDWrvWRxEyk4L1aseKB8E0L7DfiHriLAaz7UeE4fKqVcLFgV0+P3gjXjB/yx+7A2d3PqnNyKPh35oDlm3KlYF0oIZFoR8XXOKXcKZt0YJIkDohl4iBRhmolDEapCcGAEQgn7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i51QG8SQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i51QG8SQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d3ecad390so608028f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083400; x=1729688200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMVVltUWdMtnuXNP9nQSpMjW1IgqeHbCC5jnlf5pw3k=;
        b=i51QG8SQVnGLOIsV/hjhjOUB7e5oV+zFNx27dHSanBAbD2l/wRYuspetgJqC48NgmG
         qRMVAfzE27hx1/TOQ3LKSM58MHE6MfQT2TPVC0XdlisOB9K5KLW2Bh6LslbVYLn4nuwJ
         W+vXuDcPe5xBsFusw8XW/wBEWNDyQSSO0EPguy/t1dMUMFrh0MJr3NZKvFLSTGUcT9ra
         hgPKWLG5paZydmj4LW7s3uSExdQtWL3+HQTzdeLI93MbaIRpvEgPUXFo3fEUSbneIqDr
         q18ZIfUGR3UwGPd6wWnVslw5z89pN6Pr2kC8IE2IuD8FR5jT01GcKnRjOi7uYHw+ajaz
         493A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083400; x=1729688200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMVVltUWdMtnuXNP9nQSpMjW1IgqeHbCC5jnlf5pw3k=;
        b=nZnCLvHTDfIDTswrBeUzGTzBQjr1ki9odeZrTeU+SdPrLf2e4HINRTO7sYYQlKcGoN
         i+u2qPkhcLfF3SevkyaZ/Z6XKCm4IYopkds5p7cpZ7tChjPWMHp5LzAqFawe+jn3erak
         asYgNhRBlrwYYo0LqZtRDfbi6TbPNWLyklFvO/QVWYZp+aeQLJtOtkW8xD5h85ympSMz
         hGbQ83yt7t3l68iqFRdxM++tDVU70Qvw14R7/Za9RVsahW5UKdIxz6BsbwML4Nd275m/
         mXKB8W1EJiH+bl2PFnN8cBAOi+bF8a8lt9UmCeGaM+Lv7wyyW3D0s4FZJ7N3uFDDnhkL
         gvDg==
X-Gm-Message-State: AOJu0YwjkOcelty7t8tCkM53SVrxpVlwECvjWFZXtBsKhe9FgNkZe8pH
	Ef8FtK+lyKEKtwCV9BmwYRD7+7KMjA8ehpggH0WWS2I80evrutZP70XqZgKrxNo=
X-Google-Smtp-Source: AGHT+IHFg4u2vInj3bogDhwHpYynPjQNZ9iVtaMtI2rNs8AEUe6/GjTr8zJBnz5+mz9uK9yBUIU4/w==
X-Received: by 2002:adf:f985:0:b0:371:6fc7:d45d with SMTP id ffacd0b85a97d-37d5519d62cmr13994792f8f.2.1729083399823;
        Wed, 16 Oct 2024 05:56:39 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a13bsm4249405f8f.13.2024.10.16.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:56:39 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH 2/4] drivers: staging: rtl8723bs: Fix space coding style issue.
Date: Wed, 16 Oct 2024 14:56:28 +0200
Message-Id: <20241016125630.2479807-3-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Remove unnecessary space before tab.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1ced6f7ac552..56a85174965c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -436,8 +436,8 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 }
 
 /*  */
-/* 	Description: */
-/* 		Enter the leisure power save mode. */
+/*	Description: */
+/*		Enter the leisure power save mode. */
 /*  */
 void LPS_Enter(struct adapter *padapter, const char *msg)
 {
@@ -476,8 +476,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 }
 
 /*  */
-/* 	Description: */
-/* 		Leave the leisure power save mode. */
+/*	Description: */
+/*		Leave the leisure power save mode. */
 /*  */
 void LPS_Leave(struct adapter *padapter, const char *msg)
 {
-- 
2.34.1

