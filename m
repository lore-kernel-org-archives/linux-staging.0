Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279B35CA1
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:30:46 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bg10so27945522ejb.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=duxIQa38l5Vx3zHZUfG7pCHqZ11ClbH921hoe86DwF4=;
        b=nFgg1jcLmoGkjXe/yOB2v3smQ01rvtMIvZJssfGp537oqtgrI2qeupJqHr++hHinPf
         uzA4DQ5tXoN4PLkRRvYH5Kj1xa6f9uWRY02L66BSGxRysSE2m8r3GYBx0AnUffg6SV3I
         A7lrnSZQSuQ9NP59c5tZNfLx7ZAoSclot7i8jf31LlLvHf44rm4sw1C/0snqwrGvHBHv
         Q+rvSvwSFpq49rqhMvfuuGIb/xwinrY3Q8FQSCIR8ZzGUyTCLYFBHNwyo1vJ8afYWzyM
         +ptGIL85FFls03r75ByEQt4h4Q+vhH0KKTqT5HSfwid2NT4XQO1n1XmA9B9xX4XvG5NB
         RvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=duxIQa38l5Vx3zHZUfG7pCHqZ11ClbH921hoe86DwF4=;
        b=bT3l8KjhUyev6QhP6IX7PdQvcxMFgiW19TffXu3rQgVxF0bA3/0Vug1TKArUy7O4Er
         Qr5Hwb5g8n9RniprThHpdFYThiZmSiKt4kSrrRndNOtAHRrtUOdCr15eyfE3CCXqo6cq
         bMx8kzR8svoGvt2g+8hGfVywGjqryIfMGcjcO/esFrjtM9iT4inGVOznhW+iLiUF/L8/
         nn21R3q3Pqvsm4dxpbHSSz4VbjePoHYGU0JJPbhuNn5vuc48kmeqgxJ/iChlc5WulGlJ
         msRRuXQQIKC6z8gapdM01CbQabbXF07JHBW/gD2cAVoome2GmTbCWG3aZ+EcAx2ADvLO
         8wHg==
X-Gm-Message-State: AOAM531okp5Ekhi00nPT3hI8DjqXxC92+y8o4GhwEr+qdswqkx595ORF
	/mULDo6xRaPIDGUfXm8Hrks=
X-Google-Smtp-Source: ABdhPJxD4menECLdNo3bqpMdiBcTjMPRE/sq2Rb0w0RTZm6w9cKCyMknqWyWde40kCYB+YiV1QW3kA==
X-Received: by 2002:a17:907:788c:b0:6ce:29d5:c075 with SMTP id ku12-20020a170907788c00b006ce29d5c075mr14028590ejc.407.1645389044574;
        Sun, 20 Feb 2022 12:30:44 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id r3sm4493631ejd.129.2022.02.20.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:30:44 -0800 (PST)
Date: Sun, 20 Feb 2022 21:30:42 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: vt6656: Remove ftrace-like logging and
 unnecessary line breaks
Message-ID: <44f469737b788d1012943eb4e95997d40a947f04.1645386791.git.philipp.g.hortmann@gmail.com>
References: <cover.1645386791.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645386791.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warnings like:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace
CHECK: Lines should not end with a '('

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/rxtx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index a31947f2620d..4d29f8ebb393 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -58,8 +58,6 @@ static struct vnt_usb_send_context
 	struct vnt_usb_send_context *context = NULL;
 	int ii;
 
-	dev_dbg(&priv->usb->dev, "%s\n", __func__);
-
 	for (ii = 0; ii < priv->num_tx_context; ii++) {
 		if (!priv->tx_context[ii])
 			return NULL;
@@ -355,10 +353,8 @@ static bool vnt_fill_txkey(struct vnt_tx_buffer *tx_buffer, struct sk_buff *skb)
 		ether_addr_copy(mic_hdr->addr2, hdr->addr2);
 		ether_addr_copy(mic_hdr->addr3, hdr->addr3);
 
-		mic_hdr->frame_control = cpu_to_le16(
-			le16_to_cpu(hdr->frame_control) & 0xc78f);
-		mic_hdr->seq_ctrl = cpu_to_le16(
-				le16_to_cpu(hdr->seq_ctrl) & 0xf);
+		mic_hdr->frame_control = cpu_to_le16(le16_to_cpu(hdr->frame_control) & 0xc78f);
+		mic_hdr->seq_ctrl = cpu_to_le16(le16_to_cpu(hdr->seq_ctrl) & 0xf);
 
 		if (ieee80211_has_a4(hdr->frame_control))
 			ether_addr_copy(mic_hdr->addr4, hdr->addr4);
-- 
2.25.1

