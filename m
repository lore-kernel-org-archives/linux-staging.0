Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58E7A;
	Mon, 18 Apr 2022 16:29:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t4so19772806pgc.1;
        Mon, 18 Apr 2022 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NnfylWN7MavTPT553g+jrwdoRsttSRF9ea+q5wroK2g=;
        b=FmFMoYGTefW+n/xauP+X3a81pJmhujkSpoC6XDS2NTi1wBUImQdjOqEfN6Nay2pmVa
         Q5fQR2dg3WNuUjHX539UdqZUfSlMEAJNGEhTU9UETcjtbMynbN+EqOJaQ6ENpO9S9hvM
         9EeFHRcnfd+Q2kjD+POOiV8QX1j+qQZQ0kBMl8FeNh+YuQTqWQ7rL4fi986KE2zwcAnG
         cJTGUoKsXGVGybL0pnBBKuY+dJknC+2iDSTgixvXEVwb11dHlmP55ra87TkKVbohLZY8
         CpvSQsgBn1lU/Q7PP91uJCscANYgHSy1AXQpJqUMMXF1I4i0ek6+Vvi5DGDRWh8m2AfF
         P+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnfylWN7MavTPT553g+jrwdoRsttSRF9ea+q5wroK2g=;
        b=Iab8HJASNf45BtnFiff1hHj2iTCJqpvQEwczG2BanszZZdchkJTYzEv4HJHe04cCTh
         oAtOte1zowhzznO5UKBkDLrqTVtRG4WYXaHfbhfu1DimHOtlhTYtDydDKEY8cFXlcfM3
         p8Ic/dZiD/ZwsT5XCqTXxN88vtO43N2+xss4dofWxWjgO31aK9+U7mWeWggxnRH86ScB
         /IhKg0QER/IdVi2IRh/3V74Ru+eQedxaJgoJPKqQaEfQ77Z4GdbNsXVncIEnmEiP14mQ
         0kPn6/PZA8Ri50s5VZtGxCn9Tw1HAV2kF5byHzugfAoiAm3e56RRnoNzDvfkwkKFNetR
         0ApQ==
X-Gm-Message-State: AOAM532qeNoSugpcfV4EcYQwroi+l4G7PPEXyDSFsXjVyndX7b1tBAik
	pYvgJiUFvAHJ5xWOxGvrKn0=
X-Google-Smtp-Source: ABdhPJxA2Go+r6mKW0OHbmQH7KoacX0ohuNjA2Mpy67TbAnVASS2Blt8F6TRSKoAqkCYwryj0oWRMg==
X-Received: by 2002:a05:6a00:218d:b0:4fd:f7a4:d4ad with SMTP id h13-20020a056a00218d00b004fdf7a4d4admr12930534pfi.83.1650299381585;
        Mon, 18 Apr 2022 09:29:41 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0039cc3c323f7sm13295602pgg.33.2022.04.18.09.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:29:41 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2 2/3] staging: media: zoran: else is not generally useful after a break or return
Date: Mon, 18 Apr 2022 21:52:46 +0530
Message-Id: <20220418162244.15346-3-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418162244.15346-1-aliyarahmani786@gmail.com>
References: <20220418162244.15346-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the else without affecting the logic. Fixes the checkpatch warning: else is not generally useful after a break or return

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 16a1f23a7f19..19732a47c8bd 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -98,9 +98,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 
 				h->attached += 1;
 				return codec;
-			} else {
-				kfree(codec);
 			}
+			kfree(codec);
 		}
 		h = h->next;
 	}
-- 
2.25.1

