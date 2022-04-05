Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF32615A7;
	Tue,  5 Apr 2022 03:16:37 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id 10so9426649qtz.11;
        Mon, 04 Apr 2022 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpmJ9JB/ykvkb+WcvF07K5tTjzwOCUQVaGyVvSReF7c=;
        b=Z7GpZlyDyQiEzgCn9NVqlL1a/EOlD60omRHVpUSC98e37MBwA9XFLiJosEUBFkLdux
         sHbFUF8eAsyYOEszsfiWgNA1hetcXk2YQvkIkEZmN0iwgLgKebI+NIvcwO+/kCn8iGem
         M8HGk9yJw2JhlJZTQxm79xUIzMGFNImPkMBPriRr0yUMwlSxl5r+eODQsmzXnr0VDq2H
         f/5wzQuotHv6NcH2SDh4Ujg0VFas0p4InJLON7jDQ2iYO5dygAEjMxNFUt5uFvxseik4
         PmbL177c0plkgqFHuxA6+tk5LPECgLqkbr7DjHWHvv5NkkUS4JBggVZmpoix0CzivVyX
         N9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpmJ9JB/ykvkb+WcvF07K5tTjzwOCUQVaGyVvSReF7c=;
        b=wnii45XQlN9cFdJoZ7vgEdZdl0IXHDhpX687wJGoiyR9mKZco2WgTIlwZCp2DkW9z7
         Ck55BewBStpn/eN+oMMnyRJuCZ74LN/eOByauxd83SJX6fOjtSFyKiNr2jfV6BIqq0Es
         rz7wNYtxbG0IY6CZTuOSUNgv0X0l8+adGt5UoBrgiU0JOCUivfAa3I+8BnRTFR+xxy+H
         xn+GU2yGgx4Og7NL95YDIaNHW3tL8iAGl4eDccMpYgGR040uqjJo00Sw65j8Tomvd+H7
         Fot7nwVZfSLYfBqaLkJHBsXbYgHN6uPB20VRgMncnZxDR/eAqPCtz7WYYHE9fSjyUsYX
         VY+Q==
X-Gm-Message-State: AOAM533nmDvNlMolDzgzncsW6ZCI0TB4cHRae53DYxwKZOxpXgEc2t1e
	IeFK7CI1f+4SNXaUYKePNPU=
X-Google-Smtp-Source: ABdhPJwlpP2v6CjMbc42ukFJfS0blQ4VolnyepFQ8f9fW6HWjm+Gn6GD+9s7SlxHER617ErrOGBaPA==
X-Received: by 2002:ac8:5f4f:0:b0:2e1:d42d:b5bb with SMTP id y15-20020ac85f4f000000b002e1d42db5bbmr1320722qta.48.1649128596650;
        Mon, 04 Apr 2022 20:16:36 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id j20-20020a37a014000000b0067b3a0c7d89sm7179208qke.38.2022.04.04.20.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 20:16:36 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: remove space after function name
Date: Mon,  4 Apr 2022 23:16:12 -0400
Message-Id: <86494fef795f1c3e28c55e556d68b407dadd1488.1649128267.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
References: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: space prohibited between function name and open parenthesis

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5eddff488f27..56e3b85f7006 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2388,7 +2388,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				pframe += ssid_ielen_diff;
 				pattrib->pktlen += ssid_ielen_diff;
 			}
-			kfree (buf);
+			kfree(buf);
 		}
 	} else {
 		/* timestamp will be inserted by hardware */
-- 
2.25.1

