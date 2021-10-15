Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D302C83
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 00:02:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y3so23373266wrl.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJ9h42EZq8V8uTouqjvpCukohjQ9nZfHHgB0TycmMIw=;
        b=R0zAUSmojL5KI/7M53aTElLzbIT3uHUA22GUriEBCrFpOfsheRN0osk804I/tADXz5
         2VZrqgitHi8VxW+iPFwo4Aikx7BpA57/BcnNNaaXtWo3RmxMCGQxZaHgamkVX9YzJmHZ
         Pvg0iTpIx4pg/sFrrbRa9k07pcBrkF0BAeBt3ADjVhW2992+px1ht2ZER/3n5dG+EDff
         IJvjV/djYlunF46NjPu1L+IGD/eHEfqZSQ5qHCkLblB4kKMNZrodmSg91UQwcNPfGzZm
         zlWDaPQThPQgTe7dfnbO+h+GhOEduzBBRCsBWYozfpm8xG121Bxz3gr/G5l3EKNHDmBa
         sN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJ9h42EZq8V8uTouqjvpCukohjQ9nZfHHgB0TycmMIw=;
        b=JtkJbOOLJqQI4L+utA0hcWx4xJmJaCOPXEbN92jbtHrUdo7lVcMg0YP8zX9j5andB/
         0s7S++hwhztGjDa2PnutdOi1zIQUSVX8xwCgtmw+CrJDuUJNLxou2EhZU5UJAqhFKX5z
         moGQD2WXqL/cVHteRRMjSdys2O8RyoKujvxvoAEe0G/FxPEhNsceTsSGEJy9N74jkzmK
         8ERwIMdlZFBe1YAxdPrQp5FiFqruwu/yk2i8I5NfWtyFz948AQzC2e+Lbm26InhxMdB3
         APvtP7D8ML1QrN+hG8xUyun7mQIvbe93UVNp3SpPOVIkQECcGqYfRl7unw5a1Pql3RTp
         IAmg==
X-Gm-Message-State: AOAM5304GXsV2v9h3bDGE4J3Ts8al9TodsQqJP+iVbBH9CwoR9gqplBq
	3ufqC7KyKdgztVRY4Ot+pYZxVw==
X-Google-Smtp-Source: ABdhPJy6u3Pn1Ya+r5+UZe7oicb5emKBZw0WhCRDptFGPB4wevvGZLR6bbEUcnppFwAmSgSaYp19og==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr10451098wrm.271.1634256155106;
        Thu, 14 Oct 2021 17:02:35 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id l16sm3534684wmj.33.2021.10.14.17.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 17:02:34 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove MSG_88E calls from hal/usb_halinit.c
Date: Fri, 15 Oct 2021 01:02:33 +0100
Message-Id: <20211015000233.842-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove both MSG_88E calls from hal/usb_halinit.c, as these calls serve
no purpose other than to print the name of the function they are in
(_ReadAdapterInfo8188EU) on entry and on exit, with a timing of the
function, which is better accomplished by other means. Also remove
the jiffies assignment at the start of the function, as it is no
longer used.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f6db5b05e6e7..abbd107ad3c1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1073,15 +1073,9 @@ static void _ReadRFType(struct adapter *Adapter)
 
 static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
 {
-	u32 start = jiffies;
-
-	MSG_88E("====> %s\n", __func__);
-
 	_ReadRFType(Adapter);/* rf_chip -> _InitRFType() */
 	_ReadPROMContent(Adapter);
 
-	MSG_88E("<==== %s in %d ms\n", __func__, rtw_get_passing_time_ms(start));
-
 	return _SUCCESS;
 }
 
-- 
2.31.1

