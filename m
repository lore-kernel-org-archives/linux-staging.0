Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE370
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 22:19:42 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id m11so2870955pfc.11
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LGRX6ULXaym2QnaLDDeOc3iQ2mdXQmSNVaooLdjGPVM=;
        b=tH2IxDmBOhLU/kTmr7oFMXuhAZkMQkEVcuC3YB0XMuOIJ8iHkPwBS2FL2XFHazwwha
         2Hpn9u5JppW9li+KRfcGviHcat0Y/gcgl2nieQNrrDJQFZFHbQjbz0CULc3xnAt5Z8wc
         kj8IYGrohufRONIPulOK/8LMfEV5VrNNX45l7R+F2R7WERXmYipl4dyUl/IqtpqO8si9
         yisuU/ubykbl9JanCMEAlYPy73PKf2Rx5KZ8i77gf8AjFJOmidnAOemiay+xU+b63PUn
         /+1xU3hc7OfuEgYe4glzo1JuUsotL+gSJoxFogWfzMPgLCuEAQ/oY8S7y1qRqRi0ftdo
         bvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LGRX6ULXaym2QnaLDDeOc3iQ2mdXQmSNVaooLdjGPVM=;
        b=s7Z003ESbf2ODTNY0zj1VeBqURCVhq6aBG7cGiqDszK1+ckSmFsM/uZfzmJG8GpvNE
         BBDR/s7a12yny2VuwwJRi1PFhKZRGROJmXICnC1NN5bBHtMcw5IXGQAa9DWNrQIkvTvZ
         rdFB5Xp0I8qk3Wm/d3Q0smqP86fyO7k5kz6EcZuNHJSWAFlJRj+1NOjS0LP74jNeYi3H
         rIdTmdoWz1/03d9/7bZyCRubYqaYIzIkiw2ICpx0MeZLb5DLAPDccrZ9c1O2/TPWU5Xj
         H1RZ1UV3UMGDrw01TCtopvvRifVjbGTNvAz8MHzqQdy0hhnDe4ryeuQWYL2GmHYwRD0d
         +SWg==
X-Gm-Message-State: AOAM532ksKCPKd4FfB+RSQgflkhLOPeYyj8QHBQ7dGYdh4kAgcsa1HA5
	UTE7IpUo8KlxzyzLQZDnTP0=
X-Google-Smtp-Source: ABdhPJxt23GS2GdDmzrrWB7E7KVTxxcmtikT7y6/YJa/OMyrw8mrw4n/DoxlNqLKb5idus8d/xGr/A==
X-Received: by 2002:a63:cc:: with SMTP id 195mr9911498pga.282.1617920381578;
        Thu, 08 Apr 2021 15:19:41 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id w127sm387203pfc.51.2021.04.08.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 15:19:41 -0700 (PDT)
Date: Fri, 9 Apr 2021 03:49:30 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: media: meson: vdec: matched alignment with
 parenthesis
Message-ID: <YG+Bcqxetfj98l6V@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Matched alignment with open parenthesis to meet linux kernel coding
style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 48869cc3d973..21e93a13356c 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	}
 
 	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-					(u32[]){ 8, 0 });
+				  (u32[]){ 8, 0 });
 	if (ret)
 		goto free_workspace;
 
-- 
2.30.2

