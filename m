Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653A27FB18
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763800704; cv=none; b=YQTWhlCwKaSjUez6WI0WUCykYrrGBiXTDtkM9J79SWDqL3hvfqIaIob6+rJE56q1JKmT+u+itSXmHXgstLmTFZNmkqahYFXmOCLl9GLKem2l32l90a2/n2gtACpTNHq0phpLgcu/Er7zsJ3/VY3lBq9RPGJaO7fYeUObnuzzTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763800704; c=relaxed/simple;
	bh=/E+AZA1M6iKEH07yXamPANq64XYIOi1xa4NoClhjtks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2ke98x8gyVhYRr7MxyOKeTOv7G8bOon0NUfyZdCos6GuijC9ORZV61kCzlmokSJGMfAMGIq3tzFT3xtt6qrLZNs9HkHbNA52NwBkS8uRl4rt8GDtsC/pNILrxPZXctb6Apf62hPHX9ZwrW0nn1MLggNUVeQP8oF1wl/+WO7+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxvnYPuV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxvnYPuV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298250d7769so20935685ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 00:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763800702; x=1764405502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VmZi+XsGyembJH8sEyfQBTag2EbSAHD6fF836jnsIc=;
        b=VxvnYPuV/O1XYetVgPSgq6Su1SB7nnTbSdN6qa9oE77j43O17aS9U76RsT5xS06Wib
         HtdW9z6lT/jzDmBlexRSD6Pz2dx71IcW5FDqR5zjfhHMSmUzdUdx/wmTtppixt2zpgc3
         Mlo0gyzdmQefyl/LWypmODv3S/xCgfW7hoYm54iA9zlbCN3yc3Rq50XEap3IKfjy0s26
         xvX9AJRDLRaWMyv4X1GzxVH82gX8oCdNGIjbvOJPB/b3rVrpvcNHCcmHI8/fmnuNyc8K
         ilB9n4OiQRtGCdvZcDMPRTP58MHuO/90JTj04VZ74AjAmYQoeT41Ap2+cC4BbXagNAUW
         QA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763800702; x=1764405502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VmZi+XsGyembJH8sEyfQBTag2EbSAHD6fF836jnsIc=;
        b=bSClvaBB/scuwgvcElBlAlEqyWaO8M5Rg469CiwVYew1NjLco5+2VmTaqe6S1/gNZl
         buYQf9LwoLJRQojzfMpuxzMIizX+w9R4k0mdACABbOZYjvGs+7vt7KpuxkDPvZfNo5E9
         6bq41oFCuUfFDiACt+NIAA70h4pbOum7/QxZaUlqyqzViMv6Zv0UzuL7JevPcxtxARgV
         ZyyielOBlYojoeMw+AZuWXvCtIMLS0OvibWySyiQ3wYuc3+r50jlNN8e//B9/BrL+SJn
         4M8ew2jmWnw1Bmh3PUnB74YMXf0f2xDVKGInaCNMMR/LQoFM5uZFM9TVLKqDWs/oo/18
         zVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7edkzF5Yr14XmTg49o7b2FCEx5dbA7aytr1/vaqRkqYocFrKqWyS9i7FLRZUCTZ5bqVLVI8pl8VKv9AsZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr0BEp7XRYK2fukw++ePuoOX+WSYEAuTkmELB+NeVBzE9lVTYB
	pCsbxo8pNjOz71JLtuE7hY10BBQHvhwGJN/KdUO1TVzO+O/A90olqxk9t8POm5237g==
X-Gm-Gg: ASbGncsF5w5dFyIDA168soC2Wcrs5wqMySZgb68RzSwW7q0H1N2APJRKuaWRqHqfy54
	DHwsjckTpq1+kWjVIYTxdvvuX2cE6HtI2TeY4mkZ7BzoNoeqHg4kgN9nvcoHwvOWtA1E5e5r9yG
	4t6USvvXf76qFKK75IjK03bi3FCVTy15CqV0aJSTM5IRAq/V/DmFeluLD1KLCdy0SaDA3B/9qF0
	7pERSgcQQ6MUMsB/gs2zAEQpgLWKso1DSPcUYWf9pC5xY7kHDNaqcG2FbONUKosjd0nmcf8pECu
	5UBfum70xm3UWaheZZ6p3CXOuTacWEzbqeYoKw2tO+oXzlLunQa/20VzipVWKZBMR3wM7q1QKEc
	7xothqiYUEqhWQoLGGUHqHMkw/PtHzl7xKwDZCii2Iw77h9mA89ggqy0HgwoEKDmazIjTDCD5AR
	9evsKtkWtOng0WYPeyuQFXnFYnp/9qlx1FQzOC7giEq3FMem4=
X-Google-Smtp-Source: AGHT+IE6Bwt2XU0d7RVgrZTPP+UWNhOXbNNDhENa7OS6L/W5dtCZtXAohd7LmHb1i9/zYR+bLBwLnw==
X-Received: by 2002:a17:903:1b43:b0:294:cc1d:e28d with SMTP id d9443c01a7336-29b6c50c704mr63285865ad.25.1763800701905;
        Sat, 22 Nov 2025 00:38:21 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:8ccb:550c:e84d:a5b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2809b6sm78503565ad.76.2025.11.22.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 00:38:21 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: make envp[] static const
Date: Sat, 22 Nov 2025 14:08:13 +0530
Message-ID: <20251122083814.49753-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The envp[] array contains string literals and is never modified.
Declare it as 'static const char * const' to place it in read-only
memory and avoid unnecessary stack usage.

This fixes a checkpatch warning:
"char * array declaration might be better as static const"

Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..1b83c05f2434 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	static const char * const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.43.0

