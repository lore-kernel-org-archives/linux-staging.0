Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D072
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id h9so38431343ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yj1Ue2jMXvR7X0uHJnNJMhKnuo4YtIqgemMSiUhxv3Q=;
        b=Vkn4HafvOIp/HWLPzqTFHfRKzeWas98kiWPTw58yRFaP+XCOAN3p4UOYXkjWVAFLQ9
         dBH5zySk1ulGI+/CuKPt3rl7PUU8JQ4iJ8o+gWz5GBheqPxWxwSCBaHQUrbQkkPM7J0a
         m1lssgE+31ZEpGptu+Nh1nbn8axUTstJCl6pIUz5+75o2YYU5EXEt6dgj3qBb50KENAp
         WBLXua+HFgSG46ObDooRjaeeh4Uu1Kdu2HFVPmZTF6BXqmKUy7UE/RBal5bC9oE9Ghsb
         RbEyVvB0LiBMk/Kj1AVdqitwBAAuNzgfrfES0+ODGPNviemBKp9rqkNHgkbyTDTsk1N8
         8m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yj1Ue2jMXvR7X0uHJnNJMhKnuo4YtIqgemMSiUhxv3Q=;
        b=K4wp4fanhyn7UBSSAoqBRekb6vtoX7HHC89DiEqNJzNLrt01HFHQqwSpLhjJV+kRtn
         KuYS9PIqFQriwcMWZW+/kLJS9RikUJdaxdbPKiiuoZdjB9/sF/PByuWlIk/Gh0l/xYO/
         sLpdwJjnKldcb96Vy0hI702EuRlPKPBZEDxotimf351dnmXHgJnmL6syusHxF0ET4qk6
         QfK9I5wT5+SQf3Jm0tksR39S9Qi+8wHItALw7dPPgcxtflFK1DPgveFQM1E/7Vq3haNp
         SSOTppTG5/5m/9oQSea0BjEc7ZcLXmjSHUp4HnOl3egVq3arbFqRYIP6GXjJ/yDD0c5i
         WoGg==
X-Gm-Message-State: AOAM531vpGKwnPh/0LiStsbtYONCxHCRr1CVTeom/YT1F+OMu0LE1ygU
	eTiZYZZKI4J6Zd3C4QUzcNs=
X-Google-Smtp-Source: ABdhPJzINKvfz4RZjtwI+d/ez/Pc0GdF8yHiLStweP09PqhEOcdDjmP6xbmW2MZWSh+qgC6RG2mt3Q==
X-Received: by 2002:a17:906:edc3:: with SMTP id sb3mr37395976ejb.114.1629738043326;
        Mon, 23 Aug 2021 10:00:43 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:42 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] staging: r8188eu: restricted __be16 degrades to int
Date: Mon, 23 Aug 2021 22:30:26 +0530
Message-Id: <7572c80d90b499df7e9feb4781c07967fa31bf88.1629563318.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629563318.git.aakashhemadri123@gmail.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:73:23: warning: restricted __be16 degrades to integer

Here tag->tag_len is be16, use be16_to_cpu()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---

Prefer using be16_to_cpu() over ntohs()

 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index ee52f28a1e56..f6d1f6029ec3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len) {
 		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
 		return -1;
-- 
2.32.0

