Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAA7B;
	Fri, 21 Oct 2022 10:34:28 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id j23so3089842lji.8;
        Fri, 21 Oct 2022 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWh3t522ptergEdRtDg24Vu5gqW3co9XQ8DD7IBqLdo=;
        b=Ayne00Q/waYSFrW3Y0zxKIZOglh4N8AHXw2NBZq4ILol0bck11j+D2UC31M7jFMS9F
         PbQ0ORyqtasaYwRUEKF2iDl4B4H0cq3AZ22pSDvP254//UZ4ZfeeorpfMqGLfqvQ//AG
         dXn7eEXIFbOubGFqGVW3bwg2zv732/0/5dd5FEi1iJpPx5WVN5WXtKd8GIJhCh5JvjUb
         Wg27zfVib1mPD392i0s3RIzYzRGKnHM/6xlgG648jvC8rWG3gymhYrMgPszyWIxNz5Cn
         NxOALG5wpRpk7s3GVVP31BK3ywtHjw1dfhOfnP8umuA05lyxceEhpiTyORCPd/MVuWvP
         oBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWh3t522ptergEdRtDg24Vu5gqW3co9XQ8DD7IBqLdo=;
        b=Up9sdMp8PLb4vk3+luZH9p7zQT0SIyg/2EFkINvV4HE7DTsaFAhMicwGnJPNPQEL+p
         Kwat8t9N90w14qKpAYnFeRcj6IVfXD5SfHz++26kaUeH8aBZHT7fBlYDZBmKRR11AImT
         IYXhNNCHR7D78Tv2VVCtNSCPBdi2t6K9PykKTDocYaMbKCGH3A0qFrqg6Pxm7v8Fl6Yo
         DWz6NaD111sKuG+jvIGQBndQRw4XvpAazERHip7pL9hCyZcFzpbnpKdwy6qhSHHiNknA
         /CK2n1qdwhCfmyDU0iJ9HT/ev0Yl1JgNYgqtwd+qUJPzn6CeyyYDbcXvkN0o93H2Qozz
         nSTw==
X-Gm-Message-State: ACrzQf2q7FACRBDtjFXq1XhEm5aGjq4hGwIyXcw2XoZP5NxxtOu6BTA4
	6/GwGVE9mN+KBr05ImU6uk49m7sgrdC8BfbL
X-Google-Smtp-Source: AMsMyM7Wdi6BiRZN8TWzlthZuBTCl0pLZWneFMtYScLZrk7Kd80frvje9gHjn7JIXYjyGB+UAUvNNA==
X-Received: by 2002:a2e:8697:0:b0:26f:b795:8b39 with SMTP id l23-20020a2e8697000000b0026fb7958b39mr6699546lji.218.1666348466460;
        Fri, 21 Oct 2022 03:34:26 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id u12-20020ac258cc000000b00492d7a7b4e3sm3119775lfo.4.2022.10.21.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:34:26 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Fri, 21 Oct 2022 10:33:10 +0000
Message-Id: <3df55cf2362694891a311692eb63cc19913abf01.1666347511.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666347511.git.tanjubrunostar0@gmail.com>
References: <cover.1666347511.git.tanjubrunostar0@gmail.com>
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

