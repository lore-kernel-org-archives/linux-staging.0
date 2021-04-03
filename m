Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC554259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j18so6540040wra.2
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVLSD6TsWDnyVwfKOiwMsJMVRC8hKmFN/FvLWADHKVg=;
        b=jYcTywjpI9wRKeO+xDLAdA12Ly6M/Tuf0eNBRqpBo6wo9G1JQzI+V1DlJ1I3UHRexb
         qPA4qjAPHcZt31j8I5tNwaLVMxyyUeRy6P2I/JgMXcPktpIc67AxYMvJ8ICtQpCTBxYn
         scCE9jdVnHieBRRjgc5QWt8VQc9W3mVjo67NC/Zg8xAn6p6+n4u/pVo6BaX0jwyQYmhb
         Z7Frm8Cg1h2pQEec1+jWVCgcf0JoXS2Gvs0LBZM5SIN9fQFn2GixLVwl/srJbyKbEt7A
         fehIpn2wLz90YM6NvaK74lfjYDPvXBPDAKCDvB9ebrWuHVTUcV04/FqLJuq9W0UbIUIc
         ifDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVLSD6TsWDnyVwfKOiwMsJMVRC8hKmFN/FvLWADHKVg=;
        b=UdIuYUzwhlAim2I80X1/I+oE81jSXd3fLkceg0OQaC0fHV5HJrkzvIfKUCy3HNv/Zq
         dcDiVxTCyZ8I3+PQBhw0iKem2NIbJZCYvFaCaboff9+g5wnYndUhHqNedS+BeEf484LW
         0Cq1d4a7m30tXqtIXBF8PylRkf/aG9pbgbEYS4hcN8PyYB6LKYBRNQxyTEh42U4jEK7k
         o00GcGaxIkMWouLgjFXcp5+VhrhxjAdXXUHI47IIAFGDPW6H9s3mjTmbwt4koN28FKgf
         VfnvYhpgW/vyJpbuMwxVXutuNITVgV5LlLZR7a53UEYeLs51NwMgo3YdsOxhPeSXT0n5
         JXlA==
X-Gm-Message-State: AOAM531cFhawRbXIQAzoPcwhZJpcOAoQac+cEu/3NuoOFZzY2pSX96y1
	9/TsIh0aydKXEDtc+ZbGMvk=
X-Google-Smtp-Source: ABdhPJwwCLAB+8NG0yQX40fYgzPAkr52K/h+ej3kb2CsDsWQvXMklHKV6Sf+p6gR9FCVjl7XJb3L4w==
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr19876883wru.361.1617441257573;
        Sat, 03 Apr 2021 02:14:17 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id w3sm679711wmi.9.2021.04.03.02.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 02/30] staging: rtl8723bs: fix condition in if statement in core/rtw_xmit.c
Date: Sat,  3 Apr 2021 11:13:24 +0200
Message-Id: <45793b555f46312ea3c9cd285886dec22f3a1131.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
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

