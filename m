Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E074E4EB;
	Mon, 20 Mar 2023 12:10:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id o12so45780843edb.9;
        Mon, 20 Mar 2023 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679314237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lejGXvtxYXPbRbirbLrzty70j8ZQG2QJS1aPe94BDQ0=;
        b=JsaW7C+nAECp/HhGauljm8wmqVzAsC/nrlVXgaaVojvuNY08+jfmVumCbRqCi1cShv
         D46LiHX02jZ1AhFY4aRc6qhjdoNU/v1xjyt6RYmFGMNn7cz56B53GUIomyHDc1ZhIFT1
         a0ly2IFDqA8zI3nZdGNvM70XSD+lX4BMAgndCw1pC68obu20QjYQBxC9KFtEwgbKuTVI
         FyJko3QWQwu49mF3HzXJB8ojP+ec9Jp5nK1vnLPURfrQft5jkDbn3CyLho3FxZ9BUVza
         mqZD+m/s5KnSGn1QVZ8dhHSDdFHHOEIaPDj6NI/PMOGYLL5SUiUsJoAPbSOs/bUPoAuM
         6WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679314237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lejGXvtxYXPbRbirbLrzty70j8ZQG2QJS1aPe94BDQ0=;
        b=glgz6UJ9JNLQx3jUVe0T+8EeEZ/XHx/nUVTv+M57YcSNI3IN1o9Ihely/JyhVlFfWZ
         QJhs4GL8j+EVx43XFB1T8ScwhUeeoWnFkmN43ZEFf2S/78Ezfb7gHMPZ9xDvZWPq/PDH
         iS90syEAjqrK5x4uCBy/W7zoiWJDEHykk5+rbwAu+6g4PTHa/7edfhXeKZbh3SZxL4jF
         lED5G9hHajKPnMLbcZHeA13igvmlYwLIy39fCfRoZ59vlIauDLrk5A1tYXb/yn5BDfDo
         bdTqngzY7nlFlvJIWjTjMMlkwa2Yab6/wRdCUk3UJXef31AWqwLlGeMwddhw1VYoeSTO
         zy7g==
X-Gm-Message-State: AO0yUKVWTwCMt13LO3ZSAIt6KqMC/P8zsW2rsA3Q+ZYb4wpfUuQEE9/b
	g+puLeYaied7iJrykHpr2oU=
X-Google-Smtp-Source: AK7set9IVH1ZPd+u+qXJXskzpIA4kaSshW23le6se8QUxh4nKLX0DNUggBx6rPK4R2KEJ8bchoKneg==
X-Received: by 2002:a17:906:bcf4:b0:920:7a99:dcd4 with SMTP id op20-20020a170906bcf400b009207a99dcd4mr9151233ejb.62.1679314237193;
        Mon, 20 Mar 2023 05:10:37 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906044e00b0093204090617sm4059402eja.36.2023.03.20.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 05:10:36 -0700 (PDT)
Date: Mon, 20 Mar 2023 17:10:34 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fix line ending with '('
Message-ID: <ZBhNOkQbG4ygNF98@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the first parameter right after the '(' in the function call line.
Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 62d7674852be..08e6a807c132 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -24,9 +24,8 @@ struct gbaudio_ctl_pvt {
 	struct gb_audio_ctl_elem_info *info;
 };

-static struct gbaudio_module_info *find_gb_module(
-					struct gbaudio_codec_info *codec,
-					char const *name)
+static struct gbaudio_module_info *find_gb_module(struct gbaudio_codec_info *codec,
+						  char const *name)
 {
 	int dev_id;
 	char begin[NAME_SIZE];
--
2.34.1

