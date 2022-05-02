Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1892F2A
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651511330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vUwB/ObsvhfAeYdc94J/vluBprubJpnzEDKGgG5UEn8=;
	b=FRd6+pJdhtZon64Y3NeRLl/sjZU/Zcvy55kots7U3fXU1kRqEfhVdHbeB4kiZikXT59A0l
	rCqc0YUD2KAL/3FJMa9soBYbIXwAbvB0fQM7GDzHXkXNI4ZhrdGjF7Cxzb1r6bVQBKPwpm
	urhKWn0nALXGGVSg7Jjz4ZfuOwBRkBk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-4HcbxnhYO3Oi3VNt_3QPDw-1; Mon, 02 May 2022 13:08:49 -0400
X-MC-Unique: 4HcbxnhYO3Oi3VNt_3QPDw-1
Received: by mail-qt1-f198.google.com with SMTP id a24-20020ac81098000000b002e1e06a72aeso11394513qtj.6
        for <linux-staging@lists.linux.dev>; Mon, 02 May 2022 10:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vUwB/ObsvhfAeYdc94J/vluBprubJpnzEDKGgG5UEn8=;
        b=5MpMywB1VM9Uj3SfZZBaAZe2/HswdNIMMXmFfpucPijFEX1bnh0btQUkjknlnf9BhD
         T95G8kzCNohd87oPRGEpeZ49m6AHZkD+GzP/jxC6JKdHp9OBNI8a0FYsF9W26xNRr+vl
         BS/TWCiW9dsv3IkY2/7EA4rDpLMwcyDotEv0AFiAMFtbv6KOOLY/U5GNLjIulB+nNTI8
         Q4KxPJu7pqRjo9R4Ca9DgdlkwCl/rIsjtT/a6VB8Vu9Bgi81bG2g6U3dRkchCFl0n0GW
         7poSDrKxbVJNN7EWkBc2R60GddDFUbMMDCwLT55pzsNvuk3OsmHOeX1nHKL7lr4Zf/XB
         iCnw==
X-Gm-Message-State: AOAM531Udg4BV0JhtHMBvrPH+8Psr9JdHk+naQGeWQ8gYtNRkFoZ270n
	qoKJkCJ5dSu0YCfddTJcG+S73qwcbrQSJ5ue4qVH9DANikjXeyHyOUCk4ONFmOBBctdsj9xgDPs
	7PEipgPqhK7Til8NPICRSnsj81Q==
X-Received: by 2002:a05:622a:1012:b0:2e1:e7f3:5c89 with SMTP id d18-20020a05622a101200b002e1e7f35c89mr11191079qte.550.1651511328922;
        Mon, 02 May 2022 10:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1uiEQOy0AttuZWwuG2nj7JekcJUIdCT/k4msCkxiX30JIboupy20ctm7seHGiEzL9f5Z53A==
X-Received: by 2002:a05:622a:1012:b0:2e1:e7f3:5c89 with SMTP id d18-20020a05622a101200b002e1e7f35c89mr11191046qte.550.1651511328621;
        Mon, 02 May 2022 10:08:48 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id bq34-20020a05620a46a200b0069fc13ce248sm4606429qkb.121.2022.05.02.10.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 10:08:48 -0700 (PDT)
Date: Mon, 2 May 2022 13:08:46 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] staging: vchiq_arm: use standard print helpers
Message-ID: <YnAQHjPVSIAh6hOj@fedora>
References: <20220428150550.261499-1-athierry@redhat.com>
 <3b57224b-41a2-6393-51b8-a9c3435fa4d1@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3b57224b-41a2-6393-51b8-a9c3435fa4d1@i2se.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg, Stefan,

Thanks for your feedback! I will submit a new version that addresses it.

While rewriting the patch, I realized it might be easier and less
error-prone to remove some global variables before tackling the logging
functions. So, I will submit a new series for this first, and after that
I'll send a v3 for the logging functions.

Best regards,
Adrien

