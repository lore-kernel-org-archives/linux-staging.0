Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CEF2F80
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r11so15511392wro.9
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LBk5UwZLnUnusI8tJJ9UTs4/cIfOhq6Hn/jE2i8X2Z4=;
        b=DNsvmn1OTxLVkCw+4u07ctBLqkE4Sl+hz+WbN59BFF1cp6jxq++APyA3TvaN5cni5A
         1JbuiOl0CXdwJPXBk+x6KLhyCg6dGSPsOzhfnRjPds1GvkE1PldOvqb5sB8kbo1OfteR
         m4RibZn7R5LJsF3999Mmn1l/EGmZFEZETem+h3n6LIjJfCVVuv/KVUGbrf6W6SfsxMAg
         bwtZzQbNUS9K5GGwR86caNs0jGLkmDDZnGuFxoTtnxLMwtIwcW0CfTzqOulKNwAFF6Fr
         /8hoyd6MITv4sK803tDX8/XNgJzl3MekytGXDRSMbxpZsUu3NG2wML2p7y2JMafrkwPu
         4BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBk5UwZLnUnusI8tJJ9UTs4/cIfOhq6Hn/jE2i8X2Z4=;
        b=rpDbssfHeRAJU9KB5+gnc9ewvBdETyzTNT5WbvRAeLBkuKOHd7Vcs2FjbnWo4u4lfD
         jGGcFQIJNLyuUq/7w9AZju6dw+F5QfdQ/bYOPkKujjvv+JXfe/hQhfpeokExZVH3tPcj
         UqFYGnTsmYVmy1DDOFMIxLdpy/09kvXr2CxPw1BXiurPr6OlQjELNJJxO8/YhpBW6wHG
         jnEM3chgtKGOX7P9Ji1iKiNlcU6n8ZF8ZDVF0u3rEqJvuxSpiiQGns7EZ0RTOMIO25+P
         fTDefGd5djwMiTGVKPv3jnGzqzfdjiqryu9xZn0mr8LI5uFnqkVHfUrh4mnCD7nFKoah
         yTxg==
X-Gm-Message-State: AOAM532ys9WtW4fJvUP0LawVlN5Q8f27+u4HkeJY5E2OHya6uMTgvUku
	iRrZ49LFBsfALmgK3ITC3fo=
X-Google-Smtp-Source: ABdhPJwLiCYrkyPzKik4u4QgFBpdMTw447xRnzBZ2nChUpnaX+xjp+ItNRbMlbLyvd8cKLPUbd6ewA==
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr19390601wri.199.1626533827354;
        Sat, 17 Jul 2021 07:57:07 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id h20sm7642856wmb.17.2021.07.17.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] staging: rtl8723bs: fix camel case argument name in macro is_supported_tx_cck
Date: Sat, 17 Jul 2021 16:56:51 +0200
Message-Id: <f38fbb1388a54c78602750ecb86d0716d1aaf66b.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case argument name in is_supported_tx_cck

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 07cff4c490a0..b3a9bcce4c44 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -158,7 +158,7 @@ enum network_type {
 
 #define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-#define is_supported_tx_cck(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
+#define is_supported_tx_cck(net_type) (((net_type) & (WIRELESS_11B)) ? true : false)
 #define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
 
 struct ieee_param {
-- 
2.20.1

