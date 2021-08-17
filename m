Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F92FB3
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 02:26:41 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id bo18so29625247pjb.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FWNnDIf7lR/tz2VZKV6IB/1yvEwFpEjUtpbKurshWbk=;
        b=ASqMWxEKgXs1bymmIIZU51IAFsCKQaUQRblmjypHS3OWUnJb6FBLFQbAHMQ0ERCei3
         SQRCkIbVH2H526xT+bV27fciVbykdeliBporLf9DiVCTCwzX2zO5k33oWviHxeAS5ED5
         ulWpP20UPmlUd2cibBn6yqi5Fp+8vgfZP7wQlR6snfurHqgFCDMN5v12LKlzxZNn6Nra
         29Q652TgfYkCXVJ2aIYMvwQVxHkgiweARBoWbt0T7exeZqBXOmWZCbAPJ/fR2MPHLBFC
         pJa1WzYXZ8ee6dTGqjfcF2CM6Qp1ounbybw30loPmnjL0RE/EFLyW7LxMPMOeIVxYSL3
         0IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FWNnDIf7lR/tz2VZKV6IB/1yvEwFpEjUtpbKurshWbk=;
        b=ihw/TillTo2ssDuNa5KKBL/SS2CfKhx2wbFRSboOLSXoRYnQV4STH3h6yiPqB1kusC
         FnxMbemJOBA4z+JVio/b4a7/UA7g0cPurPSmMAvyxa+9EzRYP0mSjK9hCQQh7kPrU1o1
         El14qY183N6+CvV05RqNLJyyJWaebV62Yj07MvXkeayo/O80lSQJpMrj6iqLMmVixLmr
         aieN0xRURHmyphwUJ/oZGYTOcDhAo7L1AutLmsOeW1pfR2CDwHpQ/tT9Gs9TwcgY5KuG
         6rNrQte78hfmi7j/NnIYjfzHaAfoUdvmRQy+HH8WSpA1q2TVebR0//pz1Y3ODRQQXrWk
         ojiw==
X-Gm-Message-State: AOAM532yqtr721bXJHrwUmoV9+eBkEBbEgMYFjGDAkDNY8Cbffen+Q6Q
	Gn2JloH5pKF0gMiD/wagMII=
X-Google-Smtp-Source: ABdhPJxmu+4ykKpn6leZGqXVL7tzI6yNh973tz7VdUisKjXeWR6Gj1z8Zd7fL4/WHtiHTJTbCY2fkg==
X-Received: by 2002:a17:90a:1616:: with SMTP id n22mr1111887pja.141.1629167200979;
        Mon, 16 Aug 2021 19:26:40 -0700 (PDT)
Received: from abhishek-Lenovo-ideapad-110-15AST ([103.58.155.246])
        by smtp.gmail.com with ESMTPSA id q13sm391431pjq.10.2021.08.16.19.26.40
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 16 Aug 2021 19:26:40 -0700 (PDT)
From: Abhishek Anand Kulkarni <kulkarniabhishekanand@gmail.com>
X-Google-Original-From: Abhishek Anand Kulkarni <kulkaraniabhishekanand@gmail.com>
Date: Tue, 17 Aug 2021 07:56:38 +0530
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kulkarniabhishekanand@gmail.com
Subject: [PATCH] staging: r8188eu: Add spaces before and after logical '&'
Message-ID: <20210817022628.GA6595@abhishek-Lenovo-ideapad-110-15AST>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Fix Checkpatch.pl warning to add space before and after logical '&'
operator

Signed-off-by: Abhishek Anand Kulkarni <kulkaraniabhishekanand@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index a7f966a..570f25f 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -630,7 +630,7 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
 		struct ndis_802_11_wep *wep = &padapter->securitypriv.ndiswep;
 
 		wep->Length = len;
-		keyindex = key->KeyIndex&0x7fffffff;
+		keyindex = key->KeyIndex & 0x7fffffff;
 		wep->KeyIndex = keyindex ;
 		wep->KeyLength = key->KeyLength;
 
-- 
2.7.4

