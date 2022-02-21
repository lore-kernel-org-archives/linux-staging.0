Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A22568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:25:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id lw4so36432033ejb.12
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I80ySfiXhu5cxVRWbKi4neSx3+uPEnbFkKrvK2nAmUk=;
        b=WwQ8r86FA3/GDA8Kgxf9cwrsnzEZ46xyJ/oY0OkCh0pFbs1ClcKC89/dpog+m/sDNt
         j7tdCQChDDBEXCglyTmMdL/BeBMTWo2EgmMc2BN4TgbxdIGZD+c4OfzlDkPTygaOfqCb
         MOMyBLp3D+W1ld2YzWlcGXntMWsmnqV81vG7VjSRMtDIW0am5o6GY0eny7g+uAKcW+Jm
         aCyZiJJe2yRb83i6OLbdVo/sf53d+Mm7j+phdvnO0C1gGZtcjlfasXtimww/omE2mgxL
         9l4hLdBVVRdin8jq5zGeHp2sM9Dk/aGX8rzQtRyD3ivFftMyN7UQv1oUuLUvd/3k1uCq
         i84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I80ySfiXhu5cxVRWbKi4neSx3+uPEnbFkKrvK2nAmUk=;
        b=F3w8zTEpW9WtMbRJxnNArWNkkcbyMu/jwMANmZ14gAKuXQTWQqN24QY6SqVonkDejZ
         SMQKM+AGZerWtN/45uQkUhf+MYHDFGh0CcZrqPDw8HcIraYAkA5frW52eqAjFJcWBswC
         rbHWRwGS6oJghVxX4JS9YMRWapFG/KEkYPIAOj9BqvDpWNQzE5UJ2n/jqPXo6u8K1PcP
         rOc+1nDfx9a+nweZcHv8vbDZG+3+ZC+i/Udg3X/jvzOFQXCP3I6FAhyAnStegBS8Jc0G
         BTEU52jLaWbY7TupwNKPcxyUBTwj9T25sw56iUyRTEd24/TsCRp0msLDE9OmYx3DslG0
         IB9A==
X-Gm-Message-State: AOAM533ZC7mctOr/Zi1tiDGfWUGl+2ueJJW7iRwuxLxIygsHigGu3aBc
	MXNxnbEA5rDzU6d+UxclxgyqSuc9aUg=
X-Google-Smtp-Source: ABdhPJwHCYxW9Ia4ML0WjlgOFGuyUKpOSBtrvpuVVl3B7xYPpYxN8PM3EIOqKQde1vWpMQZVnFT18A==
X-Received: by 2002:a17:906:c211:b0:6ce:e221:4c21 with SMTP id d17-20020a170906c21100b006cee2214c21mr16927813ejz.691.1645478731537;
        Mon, 21 Feb 2022 13:25:31 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id d10sm5472313ejo.207.2022.02.21.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:25:31 -0800 (PST)
Date: Mon, 21 Feb 2022 22:25:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] staging: vt6656: Remove unnecessary line breaks
Message-ID: <e0d6d3d787051e3aef56fdba1aee8c2bbbe14e89.1645477326.git.philipp.g.hortmann@gmail.com>
References: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645477326.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warning like:
CHECK: Lines should not end with a '('

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Devided patch into two
---
 drivers/staging/vt6656/rxtx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index 5839b34b2e93..4d29f8ebb393 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -353,10 +353,8 @@ static bool vnt_fill_txkey(struct vnt_tx_buffer *tx_buffer, struct sk_buff *skb)
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

