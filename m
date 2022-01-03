Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFE2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:38:22 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b13so139619254edd.8
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oMh+q7mC2mFIsFYxBYOdHoBM17ue2y9c4qk5sF/l0tY=;
        b=jo1NqZ18M5fENeho9u7mnv/iD6okof2ZJHHu40MWuzynWuyY7LwdZyPhFU9W4ujJvd
         xDsVJW1WTALCsbd5INUR3un6mwJGPylj47/3j3X5sgi5DoFTkF8+rXXc+9hSkG6usrJx
         A3H8jpMjROfiG4z502ituAFjUQJWgKd2LSRB7SXvYGoVRoF5POG8RkfT2okvWyr9I8L6
         58tT/Vhjy/UPz2SL5wvmtlXyWQL8KTtIiVP8uN7IR7HfVbo5zcu3B9vIyL23nnd9YbMj
         6QVN0wDihNQHeM6aJt72i6vR2FB+zDl0ol0EUcw4GcHoTKn6GengCmbGnQkZJDlxfl97
         P1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oMh+q7mC2mFIsFYxBYOdHoBM17ue2y9c4qk5sF/l0tY=;
        b=JuN4Jdcv5HU1p0UpFVlooj+aPLxGoREFAuoTkC4DBFiYms/e/akpFa23wnNFfWqDlC
         02FwXNob9x+LgKT2PoKl3M1Z7nPkn3dWZtLEbRoBOQ21IwCDPyCB462Fu1DDKX5iyuFe
         Lm/yVsX+StEJDY6mDwzpDPuDmbYlGWe+V+vKxWJdKRtIN3RBxcX6QP+x2Jzouxw3FS3e
         QFj7lzfYlu5vcCsX/hNJN1K0pe7rYtXFFzgU+jUNw0La5YVjipGP8iKBzosLE63XDPFS
         0uzXdilAg4z1jnsOT2wAkVNbz9ZAQ5yalhmfLGO0nygBnZin/21zeypXJ+vO3/N389Sp
         5zrA==
X-Gm-Message-State: AOAM531QSSfCQOANCTOYs/0xQuPqFBWHbrPhHexhFhPcEezQWbleuktT
	U9qThC/UBo9UUj+bY7/61VI=
X-Google-Smtp-Source: ABdhPJyLVf0d2NqzeZXMVzFExPbbehQ3yj2eTcbSMWiEkRXhS8hIjHriCeOWJentwohyMvMid/YX8Q==
X-Received: by 2002:a17:907:9694:: with SMTP id hd20mr35888097ejc.360.1641238700748;
        Mon, 03 Jan 2022 11:38:20 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:38:20 -0800 (PST)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/56] staging: r8188eu: rename camelcase GetFragNum to get_frag_num
Date: Mon,  3 Jan 2022 20:02:10 +0100
Message-Id: <20220103190326.363960-36-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetFragNum to get_frag_num

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 6224e4631bf9..8bda34f87849 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1105,7 +1105,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
 
-	pattrib->frag_num = GetFragNum(ptr);
+	pattrib->frag_num = get_frag_num(ptr);
 	pattrib->seq_num = get_sequence(ptr);
 
 	pattrib->pw_save = get_pwr_mgt(ptr);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 1b2545cba279..ec9fe081dbb4 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -220,7 +220,7 @@ enum WIFI_REG_DOMAIN {
 #define get_sequence(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) >> 4)
 
-#define GetFragNum(pbuf)			\
+#define get_frag_num(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
 
 #define GetTupleCache(pbuf)			\
-- 
2.25.1

