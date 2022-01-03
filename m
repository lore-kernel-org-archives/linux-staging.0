Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D12C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:44:55 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y22so139800938edq.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8NE9tkhUUQ/TNrZqVSXwiPq/FuLNrB1Rqked7iJhAVU=;
        b=V6ZWTmjBxuWZoibMqnZLUu3c25aSYshx+MUjw9idWiwDyu8QwoVNu/khDvAYTRKVKR
         YsDt/VM7xl2xQ+lW8ZoCo2da2/S6vRl8OlWGut8reglQUbIMt0R9+kQggDAJr5aQyd3k
         c5fImm4zjiiOOoAYxsM9tUaqNnW1wSi+BAcIeS7bIYMbTJf/JN0Fbn3AttH8AarUg30s
         xy3Eb80E0U5Y0NhbSA9dGpgid9eT41cRJvjY5QW7pJ3EMcknOpzETFBtDXyrg01hG9dB
         6ckbOCjF20XKWzTxJ4znga7FXxB5ElxUcNW2H3ATvGm7fxov3bmmToLFjpAA7GQ010Cd
         BdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8NE9tkhUUQ/TNrZqVSXwiPq/FuLNrB1Rqked7iJhAVU=;
        b=kXnclM/Sylil9tDxvwQpgPCn+faYepF+1s8pUu4lnhVRnDoFsLky4pLkLXsaAP80wS
         0MYnkuR03ImBrovexSYJF42bh6NR7/59a0Cp7FXmVLLoriGFuZNtn0mPmOWX+1PEPZJh
         PiMWurVpCy3QAI3rX9a7Nz8zQL4rHkYQbunzLvZgr4COZ8TVRRfv5U6A6FZR1lBN+DGn
         Oy05JNQXy8DoLK7EQ4kOzsDbr59VmM/B8k/PkmCBJEMkalrZsfGigE8TU9AJ036IbxWr
         qpWM4YVG6S3PRoV6qhdszW4Ey/E8fAojIyUVrEZ3EdNaV+iOmHbMhA6xq3CB3mbrVynu
         44vw==
X-Gm-Message-State: AOAM532aXH4tlJB6kYD06ZtjXAH1srP+tf2LKDjgvNh+xxTM6TG7CwT9
	tWk9BJ2+wWQZ6VLwKUe1K6an6lSfZDY=
X-Google-Smtp-Source: ABdhPJygUnsdNfk2c8OsgOeTR66/xU9ogBzUeczH8k47+N4xtJUIcVnxSTHYyjPP5y3NseGjq4NZTw==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr46510113edk.192.1641239093575;
        Mon, 03 Jan 2022 11:44:53 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:44:53 -0800 (PST)
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
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/56] staging: r8188eu: add parenthesis to macro set_priority
Date: Mon,  3 Jan 2022 20:02:17 +0100
Message-Id: <20220103190326.363960-43-alb3rt0.m3rciai@gmail.com>
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

Enclose in parenthesis complex macro set_priority

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index c2edeefe452b..f6323767d659 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -234,7 +234,7 @@ enum WIFI_REG_DOMAIN {
 	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
 
 #define set_priority(pbuf, tid)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
 
 #define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
 
-- 
2.25.1

