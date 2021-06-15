Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970E6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:17 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 5so11160326qvf.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qyXNLMjCXEao6Ywzi7tBuduMSl89KvisGli0TKHERis=;
        b=e5PdQGJZzlp+vKSz7M1eAh93YZ4QMweQgNIX7AkIljYkBeF5YJiy7Fh3f8bEcticwp
         ypE246brTfY504j5XJFmEcXNBn/EZTNCvd8g1zjs9jbDDbEaTVSgEQpbrpdXnM4hT69O
         BktdSC86tRW99cyIYM+syATrcnJf08iZH9YtYYllt7vPstVJxdR3PatutDkXFMhFnKO8
         +5K5PV0XOzdRQOacc0r+GHGwO5P+woAieZKvvAnLe727PUlSCUgacqRO4aSISAk80/J+
         Ht3Wz1Uppatrwv7lAJWiCgXA83JfDe/SBr2mFihSdw1s9q9JzS4fQok71htT/hu0BWOE
         HP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyXNLMjCXEao6Ywzi7tBuduMSl89KvisGli0TKHERis=;
        b=Nz569jpfgHuwEHMzGZYAi7I5Ywa1A44no8/bEZ8ywmhdR/+cJ3h94ylv+yQljhJqE0
         O/n8cnWCgY7NQaVtwxOc/iDMyP1mtHkqZhFC/RzV8Se7X2CBqtxX6Wvtv7zet0HINteK
         ewaoucTsM2lrHlIv7GvnE5rL4pRZIoKL/YvrbPrSRrfOnUAruUNHP5guC90+3X1IUoQd
         u9MOJm8YB3UJVuGJWp5Z7oBK83FqxpcxrS0ypS5VTkgd8aWK00iy8+NJ5QGUAkkvlZqb
         Q66nvyikwq2wquAUwQqdfv48FDr6oggRpIrzNSonAyq6f4gjwN1Nhal17gKLGHrTGaKC
         icZw==
X-Gm-Message-State: AOAM530ZgJa6Z+We4WPXdae/JrFaAhpUaJ4kC1FFym8o3O3l1JPNPdpO
	EYUddeSV3WkmtFsTPgVzEHrgLQ==
X-Google-Smtp-Source: ABdhPJxwWhsQPD9Dh8PPO+M5eBShwEK0qTzxKGr8GS9HMrvUwIZvdiqaCf3UHPAONrAsm+B4hwnRzA==
X-Received: by 2002:a0c:d7c4:: with SMTP id g4mr1494428qvj.23.1623716176287;
        Mon, 14 Jun 2021 17:16:16 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:16 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/28] staging: rtl8188eu: remove all DBG_88E calls from hal/pwrseqcmd.c
Date: Tue, 15 Jun 2021 01:14:58 +0100
Message-Id: <20210615001507.1171-20-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from hal/pwrseqcmd.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/pwrseqcmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
index 34784943a7d1..fb3b0f5e8f28 100644
--- a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
+++ b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
@@ -74,10 +74,8 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, u8 cut_vers,
 					else
 						udelay(10);
 
-					if (poll_count++ > max_poll_count) {
-						DBG_88E("Fail to polling Offset[%#x]\n", offset);
+					if (poll_count++ > max_poll_count)
 						return false;
-					}
 				} while (!poll_bit);
 				break;
 			case PWR_CMD_DELAY:
-- 
2.30.2

