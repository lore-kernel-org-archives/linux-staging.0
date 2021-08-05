Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE570
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 13:11:13 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h9so9500754ejs.4
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YuTZiK//J9JAwj4PAE08Ebr5Vz170oeRV5G9mQzcF20=;
        b=P+W6LH2gBtT85pYdgfDnKnsj9a7BZd/vMK0QLxTDymVHEMh/nH2OoZ/OnOoaDINqFK
         etABbv7sTQdonN4K7P1uonfzn6cR6yt/iftCbnjS6RYn8MEuNXCQ5TocU1Mjz1JxoiUN
         rpzC0lp4X/qB9QML+TBH8z6+RwolIRFWCKby+Rl0EUNj6/KvvQvKlq4KkRxL3UGxJw1r
         GhA1cjrzbgg/rlDoYrCP+h4UOQJ+ImkAlroD5YUp8cuF5LeUY5aWrIVdRoqke439tTMj
         3vBqMUebKR8IHFCK0mo/CBbkwyetArmYtJgJ/IWhxrt7VWXP1/6b4Tx3pdSHu6wWXwvF
         mQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YuTZiK//J9JAwj4PAE08Ebr5Vz170oeRV5G9mQzcF20=;
        b=TA/e0Rthrh+pts3VrOh1gh7c98ElFHfbr6tLX3z8dv0troxinQ6eH2Df+W5unsPTKR
         z1odINU4aiUW0JuLzlVquXYJ3yaXkzsvSotH+z68tozycBOtNwvkIpzY3cLID1N1fVlJ
         C3T0WjedYVBSb5rx7PcdjGYTCftbKtQY1oygeRfM8mHqVliDahh5PJd2Y2HneY+9ApoT
         VF396mEV6iVfa7YGD1kRGcmXVx6bxxi2MxX7C58Is8dteyZxUkSO+YQ+ShwE7dZ08KHF
         M9I/8GkNb1/ml8/X2bKc8nNdIZ8tdJhM5NZHglrJgGkS+hT4Z0KiqnkzJAcDAendJXq/
         X6RQ==
X-Gm-Message-State: AOAM533HscHpONjysXJJQu2NJ+HKVrA9vf1bPr52H4P+z/IO56r4I2mY
	vlfeIwr+Xe8NFYVyOX5SIpI=
X-Google-Smtp-Source: ABdhPJwD9ix9lfeQvlComKKmYrqugIKWAfczOqDdQChbDntLD4DZCMZaRNTNQF1239hApg5LvUo9Aw==
X-Received: by 2002:a17:906:b34c:: with SMTP id cd12mr4844963ejb.104.1628169071952;
        Thu, 05 Aug 2021 06:11:11 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id qa34sm1690363ejc.120.2021.08.05.06.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 06:11:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Fix incorrect types in arguments
Date: Thu,  5 Aug 2021 15:11:08 +0200
Message-Id: <20210805131108.19775-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC + Sparse emit warnings of passing incorrect type in arguments of 
some functions because of different base types. Fix them by changing 
the types of the parameters of the above-mentioned functions.
In the meantime, remove the unnecessary casts of those arguments
which are then passed to memcpy() within those same functions.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 27c8ec3b7d62..e4110d5bc6f2 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -134,37 +134,37 @@ static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr
 }
 
 static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
-				unsigned int *ipxNetAddr, unsigned char *ipxNodeAddr)
+				__be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPX;
-	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
+	memcpy(networkAddr+1, ipxNetAddr, 4);
 	memcpy(networkAddr+5, ipxNodeAddr, 6);
 }
 
 static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
-				unsigned int *ipxNetAddr, unsigned short *ipxSocketAddr)
+				__be32 *ipxNetAddr, __be16 *ipxSocketAddr)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPX;
-	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
-	memcpy(networkAddr+5, (unsigned char *)ipxSocketAddr, 2);
+	memcpy(networkAddr+1, ipxNetAddr, 4);
+	memcpy(networkAddr+5, ipxSocketAddr, 2);
 }
 
 static inline void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
-				unsigned short *network, unsigned char *node)
+				__be16 *network, unsigned char *node)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_APPLE;
-	memcpy(networkAddr+1, (unsigned char *)network, 2);
+	memcpy(networkAddr+1, network, 2);
 	networkAddr[3] = *node;
 }
 
 static inline void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
-				unsigned char *ac_mac, unsigned short *sid)
+				unsigned char *ac_mac, __be16 *sid)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
-- 
2.32.0

