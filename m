Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829F32C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:17:39 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z29so139448700edl.7
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZzBnG5Tq6fNKffbRz6OE2Xlj0QLh5ytz67gRg7INpU0=;
        b=UTaqcYUhCOb3rqmd7JkCb5ZvPokVzDW4Sq7tzf7XBtAy0UJ0ZU3RiQs0TDhac1XDV4
         OHdSi4M5D18sExUevZq02uhK9FV/bWPO2XONEzQ2TcZzB3juAoIKq1SPVnijwkw3QtJB
         9x008MMVcg5Ebbkr/r0pgvEUJRGa6nTxSB0JEt4K8YxgS3oz4SW3TPdhd6A4gm9vo1Jw
         TyUQFAlt+8XpY/+8UD072AJGIazEvSq/nGEy/b9iNv6WNLWnGPLYIaP72tCjyiq/DPcI
         E4z1+qHQJlPe43dpY/za02CIs1f7fP87vThnC2LbKYFuMzpfr716mwUd5MD3C0pwA9z5
         ialg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZzBnG5Tq6fNKffbRz6OE2Xlj0QLh5ytz67gRg7INpU0=;
        b=cqE+WDhsSL5yi61c4/BJ2bd/UfwYfC21JPOVjF5GhtEc8I9pucjs2mxxscxOl9v8KD
         wTONibFXQ4vhviLtacbu2P2avtt7yHjCptmd96urxaPTp+ylC20rltRs+89GOKovOhfk
         PODpbU3NsqnEmU1Hesmg7QS3tGhjgdYJRJUeB5Rm5xKVhhrAREIpmSgEnNObwyNxf9Yp
         wDfB0dxb5bkxRDRPXXz7x38MAl9QMvwvkYRXaoOFRqodNA8nTKyPmcv4ys+TKsrpKz9a
         4yztoJFovNeBOCuCIn16j9yUnmmo34tqmrxji+gQT0E9LYjoSYBWvJDALCP6QgI0zx15
         OaMA==
X-Gm-Message-State: AOAM533WAfj/DD/u0TSdGxWYtM27WQL2UwNC7GIHbMbix2epa9oUKXrJ
	fEnXiLohRQqn/bLEKx+iw5UHw1ByFi4=
X-Google-Smtp-Source: ABdhPJzegIVxVKh9kTFs0NiBdhnD5cWGuyxD41QL+Mq9PNfF6Bv4PFzqxXB+VM+prYBe0aB7uWmwMA==
X-Received: by 2002:a05:6402:408:: with SMTP id q8mr23482089edv.254.1641237458038;
        Mon, 03 Jan 2022 11:17:38 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:17:37 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/56] staging: r8188eu: add parenthesis to macro clear_m_frag
Date: Mon,  3 Jan 2022 20:01:48 +0100
Message-Id: <20220103190326.363960-14-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro clear_m_frag

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index e2ec9e630fbf..30185d0dabec 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -181,7 +181,7 @@ enum WIFI_REG_DOMAIN {
 #define get_m_frag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
 
 #define clear_m_frag(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
 
 #define SetRetry(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_RETRY_)
-- 
2.25.1

