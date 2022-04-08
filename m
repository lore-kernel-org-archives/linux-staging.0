Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AD368;
	Fri,  8 Apr 2022 01:13:00 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b17-20020a0568301df100b005ce0456a9efso5114856otj.9;
        Thu, 07 Apr 2022 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V186V90RiRmSVhYLVlMF6iiT3ecZIT/E9eNPXMmo4Eo=;
        b=KzqZ51TorGTr+EP4j1Irc0/l1JWL3v0ZeQeQ16VJYgSDkRq+sNxnwTlNRZVV0IWojs
         WQQVEYmPDmqd5F7C9pZsNAS84Ou89Bqhf5YQlEGOd2t6PWoUMk2GSVWugUns2w909MMV
         ERfuSP04FvFVGkG2W0L2aeh/Sp//gHF3AirJpN1DTp3JD6Osdoh2Syb7MQfU3ZMoIVgw
         6pRwPqDD5wu3HAcXMUNJ7jB614ZHPLlFGLl44NsADqzMYEOtr/LHZeM+FE8ukEo23+Kd
         jhdu5qIvBIUaKhV758KOxoiaTL68RIkDct02h70SB6xFg9SKlEeWDN2x4MbgeoEO9Rsn
         5hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V186V90RiRmSVhYLVlMF6iiT3ecZIT/E9eNPXMmo4Eo=;
        b=qVaW1pyW4MZJJG+0c5JBKPqKsj1PcQqMT9A0joSjdQ7OzUXAAKCnGQmsw3aLEhYabK
         JJYb7w20q49BKnU+EY5DFlTGrh2I4H0iFSvQGXhXrf35ljb0SNumUWUGou9EafinSYrF
         fWCwIfvE5tv9A+6uCIfnncS73cCdCXb19Bw5Hwnly9CMtTjL3aCsp5Z2GeK/pLwWGJV6
         B44gCjxeNDXQfhy2ASco4yUUBjOC6pPO5F0/sc75MpEQeD2rViWDZTmUHLgPAX0alDtG
         DU3egfapPTtrwnGupfkIct1ZfhGS3RCHisbsRu3pQw6yeuPKpOBztGAYGwZjnJgT+8oZ
         SL7A==
X-Gm-Message-State: AOAM530x/9qmkGs3vYq8Nl4UMe1Qc7tMR4yadgPQGJLk7IEwy6plmrI3
	DxmJwDfIHnVpaXDLStgQ8eI=
X-Google-Smtp-Source: ABdhPJzZKHIkem/74LcdemHmPZpBbGzGk5KDr+8SEfEHP2t0L22fTvCTXMa5FPyf+5uOklWnehas5A==
X-Received: by 2002:a9d:ed7:0:b0:5b2:236c:b6cd with SMTP id 81-20020a9d0ed7000000b005b2236cb6cdmr5878979otj.31.1649380379842;
        Thu, 07 Apr 2022 18:12:59 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id h59-20020a9d2f41000000b005e6bbde77a8sm602544otb.76.2022.04.07.18.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 18:12:59 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8192u: replace ternary statement with if and assignment
Date: Thu,  7 Apr 2022 20:12:50 -0500
Message-Id: <36059ec66a2f3d58a8e339aa4f262772eabd3ef0.1649378587.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649378587.git.remckee0@gmail.com>
References: <cover.1649378587.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary statement with an if statement followed by an assignment
to increase readability and make error handling more obvious.
Found with minmax coccinelle script.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
index 78cc8f357bbc..9885917b9199 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
@@ -470,7 +470,9 @@ int ieee80211_wx_get_encode(struct ieee80211_device *ieee,
 		return 0;
 	}
 	len = crypt->ops->get_key(keybuf, SCM_KEY_LEN, NULL, crypt->priv);
-	erq->length = (len >= 0 ? len : 0);
+	if (len < 0)
+		len = 0;
+	erq->length = len;
 
 	erq->flags |= IW_ENCODE_ENABLED;
 
-- 
2.32.0

