Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5D6D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id x16so5299840wrn.4
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0XTNpFKePUpupflX0dLUf675z1Pas224B6agSkT6pgU=;
        b=UrQjwenA7WxWylxoVILYo797M8gt7WuRfZnPwtRi4pAXjHNQCKoBpZwL4Qy4oBKs+O
         yuUCFnwi6TZ7nFTdboeFeCk6LkKdZKdfxPEe4XP3eueHM1vxM6/Ifu6YfrsqIWS+cOCl
         3IOwghH9VAUJLTJgbtU1qnUSfJ013uTj90su5A0gIqGM3/XKpfcdxnrOAixkFIB8PA3g
         zoZRwXW8x4wZIB1awAx4ASgXvlcRUk59f5u/e85oRigBXjp2Qw4yGddSA739Enoly23k
         4Kjt8LoXvvCkNclHzkjIJ7jt+RipdRkrQ5weJgknvFhXlLMb6a+39S9kCIRXGdtwJVOx
         FevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0XTNpFKePUpupflX0dLUf675z1Pas224B6agSkT6pgU=;
        b=fUfZqemx2KO1kdd3TlmUbN7U8NwTFE3NSP2nh6XP0G1QlX43VYAS2Ys2rjY7kvl1Gx
         BgATkYqesSVLi4XXarVS3i+lY/kkxXnnonziHOncP88bXVFRq/Cw+yaEL0gDxOYr135F
         k3h+mbaBwV1dR5ugZKimlKG6jn+L+ux1IsOe/PftN9yx8qPehMS6Y2n51y4A3eS8b21r
         4JKhpW9yXslsb5150F2CW9xN98GZhXFx5XgYlYjk7tZzfNb/AO/RYHbapnxbP7cVTsA5
         abQZemHr4XGU1hARLPgDb4k/LNtjuTiq9+8hjZ/IH5QbC7PqYXgH7SdJ94CcIX0Qy5Hp
         12YA==
X-Gm-Message-State: AOAM533uJu4BrITPcNFckNxRWe2jJMy2FmvMRfNoG0eb1cpLkIzbJ1oi
	2jWv8QIF0hg8qXOjQZ5PMqCHG/ZRO7NdnA==
X-Google-Smtp-Source: ABdhPJxDnes/uol6ZOFcLq36EUEQt4F3qBr/8qC3QOtsjUwQGa4T6U8oQjjlCQbOyC0IJ0lwH+jUQw==
X-Received: by 2002:adf:f005:: with SMTP id j5mr15956882wro.423.1617384653134;
        Fri, 02 Apr 2021 10:30:53 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id b15sm15516114wmd.41.2021.04.02.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 22/30] staging: rtl8723bs: remove unnecessary parentheses
Date: Fri,  2 Apr 2021 19:30:04 +0200
Message-Id: <79185dc9fb8b7c31932e12bdbca494b127fac561.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Unnecessary parentheses around
'psecuritypriv->bcheck_grpkey == false'
24: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if ((psecuritypriv->
				bcheck_grpkey == false) &&
+				    (IS_MCAST(prxattrib->ra)
					 == true))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index c8a13d733c98..cd4324a93275 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if ((psecuritypriv->bcheck_grpkey == false) &&
+				if (psecuritypriv->bcheck_grpkey == false &&
 				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
-- 
2.20.1

