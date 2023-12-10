Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8F1B269
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="XXzA6oyu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d0a7b72203so32649575ad.2
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 11:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702237031; x=1702841831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYqVx7BSwmx7CJkNw+pgf/xGVsuqtWLaE6AqjTQ5f8w=;
        b=XXzA6oyubvWaL3z61gcryOJNbdhENsXT8/wvWSvh3gjMkbbDL/tUXATHCQYYkG4iUO
         evmwzTJHNIqZPst7yPNj5rMBlY7oiL/085J5jWq8tf77Mpx56tjw7QolmOuMl+3Ec3PH
         k5i1NnYqyxAzWN0fCW8WxfJJR8QtSSHwpRqOMkGWL4hbaLXHHAfs/+KlppcWXaWq74Fh
         JKd7Wfo0re6OwsB25Lfnz2uj/VotlRzHFFiV1L00W7wfUY585+s1SwqQA1sABPswJ3Uj
         L9QGsn8+6a1hq3d6IJiGq7MiUMw/sNtCuLnofevKtk3C5oUSdUO5XVawsl1KQMG8xze5
         5Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237031; x=1702841831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYqVx7BSwmx7CJkNw+pgf/xGVsuqtWLaE6AqjTQ5f8w=;
        b=wMlO6wBJI0vVEHNm5+X3YEoLmb8GQaSt+PwEUHHCa11p+Ga/rypADvBpcfFd9qjmpj
         cYdXo3EUoLF3e1qMltFA761AztRH0/pVisIshb+msO3Qyfe+9fCGAm0r3JBR+W7oR1je
         x9s9/+4RN8QfU7iO2oANi9iwiNrOvC5VEu9Sf7rEWKK2Ycp3MZou5tEuASmJT3AhSw72
         AbdcDPTMMJFPgN+g8UP+63aX7+1DiLWazdXMZtF9svKX4g3wCvkGzYKuabiTD64i7XEf
         InkPi0Ixdh5aHDeYHpQXTvzek1AHHoyM4bJRYp/vvfHDvcVNxFmeiscSSFzn8TmKs0qL
         r/Bw==
X-Gm-Message-State: AOJu0Yy1WZ5u6b+pbiu9jQq9IcuZYGydguH1JlPoL3AWN2A0eyLC9Zrp
	qi9x0QGBps7F+EUuei/st9iCDQ==
X-Google-Smtp-Source: AGHT+IEK160QHkpu3VcpJ0992SmIcp30ONtRFtn2YZ1IcChm75uhrH4ZjJwTYohbxjX6EWW9gvvyjQ==
X-Received: by 2002:a17:902:7ed0:b0:1d0:83af:fa0d with SMTP id p16-20020a1709027ed000b001d083affa0dmr2576323plb.112.1702237031155;
        Sun, 10 Dec 2023 11:37:11 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm5117419plk.171.2023.12.10.11.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:37:10 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/4] Staging: rtl8192e: Remove variable bLastSeg
Date: Sun, 10 Dec 2023 11:37:03 -0800
Message-Id: <20231210193705.2131807-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210193705.2131807-1-tdavies@darkphysics.net>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable bLastSeg as it is defined but never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c0a24826cd3b..fb399acb7157 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -103,7 +103,6 @@ struct cb_desc {
 	/* Tx Desc Related flags (8-9) */
 	u8 bLastIniPkt:1;
 	u8 bCmdOrInit:1;
-	u8 bLastSeg:1;
 	u8 bEncrypt:1;
 	u8 tx_dis_rate_fallback:1;
 	u8 tx_use_drv_assinged_rate:1;
-- 
2.39.2

