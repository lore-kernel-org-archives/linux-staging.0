Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985556D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:25:41 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h7so15385418qtx.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=NS2Bw26/lYixh5RZoHKAJ8ElpXYjSbxdF61bTnSB1is=;
        b=toAJnJVRjMrkpQx4FcSUcX6JbpfReRDzI23V/MWQVYtHJ5SdUfaIkhX+9spmMNyD+y
         UnPE0LJ8X2tQ3x7HG1jy146jJLpcGOEAYvLQSoaz01Oqrj6gGtX9gZbKc1aoeGAR1VOY
         DWDXcLrXDZDPn4NODgl8ioTl9jsRIh1gqfryH2XLTg75uqAbtzPnYHsqfRmBHWTZmHN+
         /9TAr2UDC8pFqlv2E9sJwxiqyzcWxkF5QOfwE4BSPETQpeIGtJymBytcBxHElDjEmo/m
         ZbwixI6k3kMkrcf2QmOh3F1oFVDo56xp1mvAQjNZVeI1ASJlbnLpuWbTAxQP36tpBZI7
         zAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=NS2Bw26/lYixh5RZoHKAJ8ElpXYjSbxdF61bTnSB1is=;
        b=Bu7zF9rpMU4yEgGGjEYv94xUpXJak2Evg2HtWMrKi/EQNBK26xUW1Lvi/0pNClKwTp
         aRJJNenb+HLb8rye5rCjW7JHoeFPN6S8jq5Csy7kLhBBTzI4zi6hn7J2C4Ivjrm2gJmc
         IpozJ7oTi+X16PXju89WYbmOmVA6aW3r9yT5gt27Ca+OIEw2PnL+2vjg2m1r0yUF2xxL
         AqHtek0jUNdoWqKrN0uzVUvwRjduoE1tNCbUTAMegQm/4pYMMhhgm0AdrlY0qhOiojLq
         3zfl+zy/PCheN+1SYVcAzshlU6uichTT4lYj85WOUTNiCpiKZCLUg19HSmevLaB0hb25
         /hiA==
X-Gm-Message-State: AOAM533TE4j0Z1GMLJQP4nCK0/SDvabtkWVj8GcnIotbgwmaIpekn5qm
	6zpHPU3tmSjGwJ9mQHt+p0U=
X-Google-Smtp-Source: ABdhPJzwU+M0Oykcfm27jfLSv0IOoPnBW+9uyyzf6trdexap9regc+qGxDIxZMTPntU8lOO3RX4cHw==
X-Received: by 2002:a05:622a:650:: with SMTP id a16mr1628999qtb.316.1618406740656;
        Wed, 14 Apr 2021 06:25:40 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id f14sm7986252qka.54.2021.04.14.06.25.39
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 06:25:40 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:25:37 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v3] staging: media: omap4iss: Remove unused macro function
Message-ID: <20210414132537.GA15742@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Remove unused macro function "v4l2_dev_to_iss_device(dev)".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v2:
 - No changes in code, just forgot to list the changes made

Changes since v1:
 - Remove only unused macro function v4l2_dev_to_iss_device(dev)
 - Left macro functions "to_iss_device()" and "to_device()"

 drivers/staging/media/omap4iss/iss.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
index b88f952..3f587e0 100644
--- a/drivers/staging/media/omap4iss/iss.h
+++ b/drivers/staging/media/omap4iss/iss.h
@@ -119,9 +119,6 @@ struct iss_device {
 	unsigned int isp_subclk_resources;
 };
 
-#define v4l2_dev_to_iss_device(dev) \
-	container_of(dev, struct iss_device, v4l2_dev)
-
 int omap4iss_get_external_info(struct iss_pipeline *pipe,
 			       struct media_link *link);
 
-- 
2.7.4

