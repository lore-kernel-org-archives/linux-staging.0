Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2945D2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:43:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z9so69795120edm.10
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Hcx6qf2z8zaxKbx48tBFA06IHix8EgYxb5MO0mrtiY=;
        b=iNoZ9D2y7Y5bYPFu3dRhpKXnYE0flZ3dqJjUxElDlw7Y9ulebMOGRHVv9FMjQlaSm7
         uXZ4i6S1+SADLDgJBv/FLZqI4Ena5peEJVEHixaK+2AMwykJ5Uz3qg/R0Z18kKLgM4TW
         bnDNeR6qQYh9z6g8tRjDZkv170dhtif2M4eFW9CVm1CZXI034ImnPsbxvjb3WWIAFtbc
         azsHPeVxUl3oa2AMUgMiFfe4CuSbInbJ1kLDdRo0554TiXK20ZfhjyFqsy8yOKec9BP7
         qUyBWexHrmIakLebi1qAqnkFwBpR324hrv5d1i/JrAkEfQM9YCUl68yBIpTwI9G/jgbp
         kE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Hcx6qf2z8zaxKbx48tBFA06IHix8EgYxb5MO0mrtiY=;
        b=CLzKBg/oQ/AjVtyQ23nvKw0XRSe7XlEoEG+f9uMA8tE7Mqv66JRO0RU+9ZW7rxp21K
         u/p0dfzvfFkaGr9y/i66zir7welQB6EFzRZpZkoXgZgSDt6SMG2KFpEqIeOb8k1Qz+6z
         8Uhi9sZnOJ+RyQ/Iy2jpxHVSlvyZmTDl2AaJiggk6scSHf/YatVzBRbIfLMbkjUk6ov8
         bb1O5dKbJUKvsCTgk8TzdXbS/+GdA38TlEsETu8NzJuNpP8jROEMYsXK/vuC90i1iNST
         tNs0k/14lkqEkamMBdwnxprjY++5dGQ071LqiVT6cCRN58K6My+/GspbTZwJEuM+LAEx
         xq3g==
X-Gm-Message-State: AOAM532O51jOsbmYpJD0VmZDKvqxPBU4/A4vK33Bw8nv86AOgV4TrpUh
	mxSO0LwbI5+qsxh2cyRfkXQ=
X-Google-Smtp-Source: ABdhPJyI9G9iuvccfJnFKinA+loTzbXmXADO0tOmibxDQlEkSYIhYkOzkxeBHfqaX3AEXSU+cRgvHg==
X-Received: by 2002:a50:e608:: with SMTP id y8mr45102596edm.39.1641239037566;
        Mon, 03 Jan 2022 11:43:57 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:43:57 -0800 (PST)
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
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 41/56] staging: r8188eu: add parenthesis to macro set_duration
Date: Mon,  3 Jan 2022 20:02:16 +0100
Message-Id: <20220103190326.363960-42-alb3rt0.m3rciai@gmail.com>
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

Enclose in parenthesis complex macro set_duration

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index f1955ddb6460..c2edeefe452b 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -231,7 +231,7 @@ enum WIFI_REG_DOMAIN {
 	} while (0)
 
 #define set_duration(pbuf, dur) \
-	*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur))
+	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
 
 #define set_priority(pbuf, tid)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf)
-- 
2.25.1

