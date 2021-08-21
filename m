Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8223FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:43 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so9299174pjb.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Zl7hpkQNAzQpl+WueTiiFC/5DwvdT2bmpyqMhyPHeA=;
        b=eIfNK6synaeafu09TGoYiy0G9RrBfE7AHjR7uG+rIaLDsrnYKv1ev3YpXnJXtwTlF/
         D1A8CwV2s6gvycKPTYxxdtO0A4cTlRRTbAMuGUpUZQFh+u2Ic9lQasy5hpEpLebjDTjJ
         n1HUKEEFp20sdwiF9JUHszLhoqD2vJ2DBQA8xDN73f7jGGhYJYHxi6FvGsbQTJwvSiDg
         fJ8ZtCiMaqoyXh2LjwWqxkG67SEORl2FIMdProQwqQPju0HpSpWvY9heYyqWEgViN1e1
         jJ52S9EytR/pThJj4EJ+2Fy6THURSkeSJrLFitLmIVM45Ig1YsdV8TEwzlj58plaEoCu
         peWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Zl7hpkQNAzQpl+WueTiiFC/5DwvdT2bmpyqMhyPHeA=;
        b=m0p77D6FGJf1UeOkYBMoNfzUj7xYTd5/k/DR2pfNrlyz34jj1wjwAldyThkJg+XakD
         lOYGIi2nFbwsDgitT8JvFTNaU/LqziLy6tLEEsxCpZstiSaRiPU+l0v9nsgDdri1p97f
         ZSJ8YTlOood4Cv/I42QtxG4w0OQHm4e3HKkpCrIBNN8eXCrjgIxPZDmIP/NdRdmmBjaZ
         2b4woDBz+oQm/2lHIzmAlxlxsLnxcujSVn2HanXa70Fs/jD5jLIpRXkjmiYCeoQooGWG
         ekH8YgZXNI6yC7baBPtYuuKFzO+zqw/THuBiDoYGtNui+KW9D+rF+DFVlF1TN5hafOvM
         7png==
X-Gm-Message-State: AOAM532+SzQoHTn6PyT0CtTiee68Yc3u6V03VFiI85Pth+K6gA6+yL6T
	iGmuY2DH1UYRuPbcLcULZsw=
X-Google-Smtp-Source: ABdhPJzYfq8vcaFzPJclS/PiPKuB9f9A6OjlxiB8LLrdaYpmoRw4Lh+tha6+624RdVktdSdnoBzKkw==
X-Received: by 2002:a17:90a:c708:: with SMTP id o8mr8419970pjt.16.1629562722713;
        Sat, 21 Aug 2021 09:18:42 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:42 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] staging: r8188eu: cast to restricted __be32
Date: Sat, 21 Aug 2021 21:48:29 +0530
Message-Id: <50439a81aca7ce8c3c97ec1c7247f4cd03f645a5.1629562355.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629562355.git.aakashhemadri123@gmail.com>
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:836:54: warning: cast to restricted __be32

dhpch->cookie is be32, change it's type.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index f6d1f6029ec3..f65d94bfa286 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -649,7 +649,7 @@ struct dhcpMessage {
 	u_int8_t chaddr[16];
 	u_int8_t sname[64];
 	u_int8_t file[128];
-	u_int32_t cookie;
+	__be32 cookie;
 	u_int8_t options[308]; /* 312 - cookie */
 };
 
@@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph =
 						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+					u32 cookie = be32_to_cpu(dhcph->cookie);
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
 						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
-- 
2.32.0

