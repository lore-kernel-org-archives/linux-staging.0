Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7D259E
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id x7so5286160wrw.10
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xeDid1qnJEENj9WSCIRwSBis6QOEga/41uImp5Q74g=;
        b=h+E7qksOk8WsELaGuFj5p3FKkDlbkaP9YdbqZ/NQIm4HgsTHMB0CS00FB1uBVaJHhD
         WiIUl+PqjoDwH86GQE07C2aju6hDTDrJOr4/dS2KU4sZhIIR9wiCtlnJMyvwoE1ddnwA
         vZtkomr5vsN8ryrSv9vmhxlndNWa/5sxK5tvl22f8VKe5JxrJT/zYIyhl59gkAaQm+7f
         y1RC8wwzF4yKfX8SZhfIH7KKT2fyY63O5lv+kPX5ZXI7n9oJTRXVd4X5WU1xK67MBWQw
         XN5jOGxPhq05Oc2ESheGmdOkKPBcyqrBEdBHiOoaR9Owu4pDSMnwXwvDKwN8SFe6OgJm
         HMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xeDid1qnJEENj9WSCIRwSBis6QOEga/41uImp5Q74g=;
        b=Zhqk/Z8i7Cl0D8c/u3zUYCHlUnmZhnrI6c3yVJykQwe1sD6duYbz3Kcomo/aRyDURD
         UjGoH7OhFAYvADLTymzyr2bx7FFDOD9RVtmmbhRv/RpeztNgnWRf1CSMJukl6QNDg/RB
         UxU4o5pufRT7hSLRsQmXrXnvGGY5ajmxLWbfmIoworqDD5N2SMG1+GE7UwXOlz4f05he
         r5beRSsxr5Ai8Unq+fUq/ZkdjO8Nc9UxuFG6NdwFzAyC8mgfzHeu5ySVgA1vU4T3T4Kn
         GhwFn7egTuxs9tLwJLNDWEKzK7CeFofXlvRtcvlxEbxCTs3ZXdwqNnbRAqrwNOlQi9ge
         a3NA==
X-Gm-Message-State: AOAM533wqwV7wI5v5NYlf9B6HZNRmThe2gJK7CCDSmBAxWvWbe0bvU2S
	Y+WkjWzWIriUPYggC9eOAvA=
X-Google-Smtp-Source: ABdhPJwiQeuTj+Pz1Ldvg4ynGsSxHSl84qcE+3JZG/0tivPbau90HL1pO3herHWjD8wLklxdUdBOeA==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr16502204wrs.406.1617384620648;
        Fri, 02 Apr 2021 10:30:20 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id u9sm11850358wmq.30.2021.04.02.10.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 02/30] staging: rtl8723bs: fix condition in if statement
Date: Fri,  2 Apr 2021 19:29:44 +0200
Message-Id: <0c394ddaeda95d55384636152896b65ed34fc9e4.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix condition warned by post-hook checkpatch

CHECK: Using comparison to true is error prone
71: FILE: drivers/staging/rtl8723bs/core/rtw_xmit.c:565:
+		((padapter->securitypriv.sw_encrypt == true) ||
		 (psecuritypriv->hw_decrypted == false)))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index beee87db85a5..957d7e3a4d4a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -562,7 +562,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false)))
+		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
-- 
2.20.1

