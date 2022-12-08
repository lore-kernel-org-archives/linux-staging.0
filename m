Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5DD7EF
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 10:42:10 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id cm20so1242897pjb.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 02:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CODFi1ANb1ySAO16p5Asfj1qvIextX70iiopA8xy4QM=;
        b=CexMx3cAR3NK1djvohOjT/FiOSMyLd2oWvWfola5CCDoFSckIdOoEgQnEEG0XJ99A4
         3tdB4UzZt874HqMzkkii2Ktk/9ACdHbn1/xT2ZgcHDc9dyqGjoeHV3q7IYB9OcoEFBX+
         BPZ3wnmUvTxg5HTExwkZkTBChBeuKH/pfVONml8ymyUOqJrqOpxNDp+k50/4uq8QEIYG
         u88ZLwVk6bQ7Ih1PUhKQiaJ/vWpP7HQMI3sYg4DUX0lEt8++YCBUkNM8yzUdRnXZgGC8
         295hOcouV0k/xP5NWhcMc02iFbVzgVH3rCqjQDa4wb3OzKKsB22qnClbEciMbsXlJi+t
         teag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CODFi1ANb1ySAO16p5Asfj1qvIextX70iiopA8xy4QM=;
        b=6nnpADWOy1u5jxhGAhDZc083rOJAmX82IXit4pEtwJsK0Pa/R5yECj6OqCRYfyjPRp
         zch+azZeePUDZqlgn9Cnf/l3HGI65k5AwdAnybk5iLK9zI1EVsMz+Ri0AipkXuXBeXtv
         5A+U/Fkz3fcffDzi3lqANxQ0WEhX5CdKU7KZNqqRX3Ym1c83IjdXBFKZTduj4ks3GQcV
         MkRdQn7X/BR9ul0MeM6lciHnDArHq2Cv4IwEbTwi6h1qIpvrtGGLPGVyL+DFhyStsh2t
         6ELnXxMvKI2XZpxoxbvyIYzyYFjgWFd345WoXn5h564MKBuVm+C/x1vv33cFnIMriTBS
         XYKw==
X-Gm-Message-State: ANoB5plG62fs1HHIqt7aElguMrQEccDJpXc4QenzW/gcvXgJDDiFayem
	uc2Yf4fdUKTSDbfDjBR9wJxkEFwMILSNDewl
X-Google-Smtp-Source: AA0mqf6/Tai4V1iD72eI7S7emTTCgEWoBIfqaMaGvnBNsCgXMyVGbQ24XlVkPT20eybFFxVn4DZW4A==
X-Received: by 2002:a17:90a:6382:b0:219:fbc:a088 with SMTP id f2-20020a17090a638200b002190fbca088mr64077086pjj.162.1670496130179;
        Thu, 08 Dec 2022 02:42:10 -0800 (PST)
Received: from zoo868e (1-170-0-91.dynamic-ip.hinet.net. [1.170.0.91])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902f54b00b00177faf558b5sm16298205plf.250.2022.12.08.02.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:42:09 -0800 (PST)
Date: Thu, 8 Dec 2022 18:42:08 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 3/3] staging: vme_user: replace 'unsigned' with 'unsigned
 int'
Message-ID: <20221208104208.GA100388@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update the bare use of "unsigned" to the preferred "unsigned int".

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 5da2643e20d5..11df0a5e7f7b 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -84,7 +84,7 @@ struct vme_error_handler {
 	unsigned long long end;		/* End of error window */
 	unsigned long long first_error;	/* Address of the first error */
 	u32 aspace;			/* Address space of error window*/
-	unsigned num_errors;		/* Number of errors */
+	unsigned int num_errors;	/* Number of errors */
 };
 
 struct vme_callback {
-- 
2.25.1
v2: Resend the correct patch set, noted by Greg Kroah-Hartmamn <gregkh@linuxfoundation.org>
	Align the comment correctly, noted by Dan Carpenter <error27@gmail.com>
