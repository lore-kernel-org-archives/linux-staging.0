Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF46D24
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id oa17so4443696pjb.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VTzxzxgtANnnZ4yDUItRXfvQkRDYdVRI72br3L7vJiU=;
        b=ulsr12LQIKBPZl89g0R0dzxz+ZIfEHuok8a8gAt2/ohMBcbIyNg5dT/lvjd1kpws/A
         8O/qCbIuPcGUp55U1nBxxEwsSw9vMS9qzHbSloRIVdCZr1a7ONJt6Y3nmtJZ5rIVTlTp
         yq/jQS+wYRWj+iNBoucGCb2aqueI7itfsM0xQmqbNbnRGiV0ZAMxmeHjATjZkS2Yc0eT
         RpxrPXU3QXNnE6egXdrASuxVuNkfmLPvtBOkmkI7JjzIHAGB/1Ja3zstVJZjNxsYM69k
         Yh9pNm7ePWvfLwh1rECCwoMGJqhsvWWeuS1RPSONhfHPxK6zA/CObSzjScnie4nnAikR
         xr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTzxzxgtANnnZ4yDUItRXfvQkRDYdVRI72br3L7vJiU=;
        b=PdWX+EUwA15lZeHkAipIE6UnlnBD6WEjoPkFUp8fIjeNDdEW9Iig6jqaDtUlyj003Q
         V7hMUYLW4ERbmV9dLM68dje8BbjQSbhc7On+89SXHTzveh+RDZIz29FEO8e1w2p9Gasj
         IzkE8DEZAQqH2Ibdmjb4lDjdO7Mn+LJd7QyV7nnngE9JeL9LW+hVPcyXIN+lAo85pgrm
         BM4v796hJ66DEehhYwnCDnUED2Kxst8Zl1KEZ/99L4lmFgItc13ubi/8ob76ecckv75O
         8GHxss+4m8V6XBmd79C7sW7ROJ+fRGUZi41Kb8sOe/gG/mVL5RyVc8o9IMz19PWc1CM2
         bRxQ==
X-Gm-Message-State: AOAM530/IpKVBAyVbEbmrfQIb7IDrTlg2lZ0ItbwPwacSTmt9r1Ya0rb
	3viCexfQBTJL8GaiL4W9axs=
X-Google-Smtp-Source: ABdhPJxkwlNSeTHHSstt+OwNXHu3Nq6pZnOaP+v7cXxc7Z8ij4lwWCQAdHCsKkPMpippPU8HlHeruw==
X-Received: by 2002:a17:90a:d587:: with SMTP id v7mr13918406pju.110.1629361091668;
        Thu, 19 Aug 2021 01:18:11 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:11 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
Date: Thu, 19 Aug 2021 13:47:54 +0530
Message-Id: <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:836:54: warning: cast to restricted __be32

Unnecessary double cast, remove them.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 404fa8904e47..6a0462ce6230 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph =
 						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+					u32 cookie = dhcph->cookie;
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
 						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
-- 
2.32.0

