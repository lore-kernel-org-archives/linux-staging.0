Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E8D259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:09:55 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso4479940wmi.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVLSD6TsWDnyVwfKOiwMsJMVRC8hKmFN/FvLWADHKVg=;
        b=i+oLZ2SWvghTyp5CK70LCoOflb9OJrNJO0xhxTyAfPy9hmtH+QY4AdFf0OrrR9T4dX
         mQ3TW4JJXkSVenFI6IauMmQRmESB9lIJp6vRntkwN3QWnhJwnRIBUf+pVZihFj2bYWCC
         4N9Wgpyggs2F83VIMo4p0+P7sSl2+WzANvrU/pLCDoIUGyxmUZ7dITTK1s7DLUqDnjKl
         P7qpsPW345TJVTTD2rdPxk/RZRbEwW4aIjahZA1JxLQIjcJVOTzt2HhMBCZwENeJqDfE
         fKW6GSjrmcaW9Wie+z6fa3h4Xy85pJkzdijKHRRz6bmfX+ZQulLPLVtTbnO48BgiDGBr
         0C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVLSD6TsWDnyVwfKOiwMsJMVRC8hKmFN/FvLWADHKVg=;
        b=WVinsX0tZy3DW6ktuJUBj/6HanbSYh+ZC4tEp44ojKjsUxS8C0L8T7Z2AlJZ8ldAvV
         Eli65f9Jwkzh2Pwy0l65YShUZE4lfv4zKIeEyBC8R09KVC3dliBExUOD1IycVpJWU6at
         3wjloTUSvS6IrBYFnd4yUW/OkIQICbByJsXc95VX9KZCXxT744tPbpKoOR7X5JIWsjNm
         GgdJ6OO4flQcCzfFpSgvUZ5keOQUWzJqa6KL/FWGTO//pdWvJTYUE21+nutVcBORaVq6
         DSDh0LDs3wkuoguYtdXF6tCPA31IyShWOPS5lAJ0IUIdwlGKVtsCMvQGfzwjxMFh/UPx
         /dpg==
X-Gm-Message-State: AOAM531yR+XRoV+vjZwWMLaf5OVSjJO6f/5p/0oNHiQeEDl4adhJfO9W
	53kmjmN8dPztHuVJvHWx0C0=
X-Google-Smtp-Source: ABdhPJyHrYHiY8iMLyZM9HGNrH+PHDFdqcZUOPwIZKctDm6WVdW0ZQGhfMu5mpsfz90AD5mbtrKekQ==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr21369149wmi.186.1617545394102;
        Sun, 04 Apr 2021 07:09:54 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id 61sm12616126wrn.25.2021.04.04.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:09:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 02/30] staging: rtl8723bs: fix condition in if statement in core/rtw_xmit.c
Date: Sun,  4 Apr 2021 16:09:18 +0200
Message-Id: <45793b555f46312ea3c9cd285886dec22f3a1131.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

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

