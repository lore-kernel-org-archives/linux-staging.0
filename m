Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4B45CA3;
	Thu, 20 Oct 2022 18:29:50 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id bu25so920015lfb.3;
        Thu, 20 Oct 2022 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWh3t522ptergEdRtDg24Vu5gqW3co9XQ8DD7IBqLdo=;
        b=aYGnchK9a2xDJ1retDATpQXkztTjuwN+mKYEt2yPgGw4fdLK2AKdEdJnjt0IfVq9lz
         o9Kdat2oekIuT+8tcrkU24zxe/nMslCR+aF/VzEp1/4Ci3Bwn0Jdm+pc2VuMTc70LRim
         NJJQJ9nCEqaqMS55YdPODP9z7WHbt6u12hhOyZAVf78lf1yLxxA9iqYgJf8NNIHa9h+H
         p6UK1fO8voEXHlOYZGOZJQ4j/Nt+zFll7189p9D58H+Y/c7KMSPozukhX7vjnt7+Mf4u
         Ziqkuv48+9hTxyEZ8zLwMgom6+IPgD7phLtnikFpizk4TZVHPX2pTzJohtNw+uAWj3gX
         V26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWh3t522ptergEdRtDg24Vu5gqW3co9XQ8DD7IBqLdo=;
        b=Ra9tED+O4Y391amnuTNbMYxEl8yVEJXQRbdupj3jbLDrvL5dF/K1g9kUTRc10czbnb
         QVvinxT6ZSbZYPuc5psTjz7SUuEs9ZiWBAOszF/CXcwqHbU6W69j2Wf3xAy3b86wQwCR
         7qqOK/dfxM5GA4HHgc40DszLPYZhvZsthW+el9Wlf3YKadvCuwxToNU8TO2Z4dlkKBRM
         xQrxYOtBYeuVN+WOptuvgRS6kHrqvwMRfYCDVzIBC6piyH+vgfA5vxUfHTx60sjDOVW/
         b+xTwlZDNlArDbinw1+mFsCw1Z/jChtKLV8ztdrMNrREw4hO03CDpEX8KEh1wzOhDJwA
         KwlQ==
X-Gm-Message-State: ACrzQf2wjotwmWp4KuTvLGN6ifmFQZjjuat6k2HKcVHecSHyKfwas8mj
	Fu6kTlQOSrmOffv7xfgGbF8=
X-Google-Smtp-Source: AMsMyM7p8zbGowZciMAA4I0/fu751l9NpSzMEqKdwhN1ku4x3a9Xw1lO4NgirZNwEk9OGwkvwl00Hw==
X-Received: by 2002:a05:6512:3b13:b0:4a2:564e:6cea with SMTP id f19-20020a0565123b1300b004a2564e6ceamr5137022lfv.242.1666290588683;
        Thu, 20 Oct 2022 11:29:48 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id h10-20020a0565123c8a00b00497a3e11608sm2797216lfv.303.2022.10.20.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 11:29:48 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: forest@alittletooquiet.net
Cc: greg@kroah.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Thu, 20 Oct 2022 18:27:46 +0000
Message-Id: <3df55cf2362694891a311692eb63cc19913abf01.1666288416.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666288416.git.tanjubrunostar0@gmail.com>
References: <cover.1666288416.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

join unnecessary split lines to avoid them ending in '('

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index b8b21cd39534..d997002ee9ff 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1301,10 +1301,8 @@ static void vnt_fill_txkey(struct ieee80211_hdr *hdr, u8 *key_buffer,
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
2.34.1

