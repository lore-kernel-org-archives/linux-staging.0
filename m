Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB3DDA3
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 20:31:37 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b9e478e122so4037094a34.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692045097; x=1692649897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UeKme4sEc98VRsrcPezzSD/G9lv9BbiEE2/5hIujaqE=;
        b=kJLq6PK2ykNvRX37Q6VUMUpSsDmRYS4psJjnv0KU7EEQQzAVQHALjtX0xXymQdQ+Kq
         eCsSSsir1g6CnQ5AGqWPodnYLhYgxZYvTGxiiZD1HrBXs+Sypvkrr9RoH1J7BWCSVWQo
         gFIB4Inpntg1trMzyVjOUIzX5s+kff2za86iaG6qhgMuP0G0i7B5hgTWgbZU0VbW7oIr
         HRtjeFZdccooS6aZtZvv4qifUYHuURemqsdJWUbtXx+ZwGfvWxaAnQ3GBbtqiZBaTonc
         AOtcKNAufZQn7uXl0wN27TvA8W2oDEo1ZAS6rBYnIlWp6WBIdbeErL5aiRMMBz6g2Yys
         qbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692045097; x=1692649897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeKme4sEc98VRsrcPezzSD/G9lv9BbiEE2/5hIujaqE=;
        b=MZUu7KvzrqP3MXG3dA6ivCWsdZmx1XqsevpQ+cWh/E/K1Smvc7cjXJNeVm5HMeqjl8
         VRYAOf9N/cV2fFafF9nFhZWG8Rh1/chOIbk0Dj/zX1jz/mGHRVJ2H0IIWb2nWytrazRg
         AXUX9z7AbYQH4QsfWECLOJmIecq4t4QxDkJRn06WWkYQwb2rw0fkLKqZ3ByXxyDWVbNe
         b7wEgC7PC3JQ9tskdxEOMPBMyikxQb6KNxI8azjoF6J/nieiR2WzuVmgGmXbFH51fpy3
         Hdl875svTiSn6tUAkdYyBH97qjnm9QZYj57XdImrDzl+1PT6IZWAIx5hqS0wMf0+6ahY
         lELQ==
X-Gm-Message-State: AOJu0YzU+BdBCGDrN+TUE7FvAB3gYG+JF1+0qVom1P8YJckcYBWvf8LZ
	rsbt5BQ/ICImq2feH4uSABg=
X-Google-Smtp-Source: AGHT+IECRZYT5ELp6Hcpx0DV5+FyMZTPsC8ENfs8ElP3NUT8kb0BwVCWuk6FvRysXQcuZL1veGVtVQ==
X-Received: by 2002:a9d:75d6:0:b0:6b9:ba85:a5fa with SMTP id c22-20020a9d75d6000000b006b9ba85a5famr10694136otl.5.1692045096640;
        Mon, 14 Aug 2023 13:31:36 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c2-20020a9d75c2000000b006b95e17fcc7sm4686409otl.49.2023.08.14.13.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:31:36 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:31:30 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check blank lines not necessary
Message-ID: <ZNqPIvaQJ9HO8p9x@alolivei-thinkpadt480s.gru.csb>
References: <ZNqBd/08H/Y5UEOm@alolivei-thinkpadt480s.gru.csb>
 <2023081448-sustainer-prelaw-25a2@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081448-sustainer-prelaw-25a2@gregkh>

On Mon, Aug 14, 2023 at 10:17:10PM +0200, Greg KH wrote:
> On Mon, Aug 14, 2023 at 04:33:11PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Blank lines aren't necessary after an open brace '{'
> > and CHECK: Blank lines aren't necessary before a close brace '}'
> > as reported by checkpatch to adhere to the Linux kernel
> > coding-style guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index 5eb0d780c77f..c7c50406c199 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -308,7 +308,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
> >  		if (((slave_image->address_attr & address) == address) &&
> >  		    ((slave_image->cycle_attr & cycle) == cycle) &&
> >  		    (slave_image->locked == 0)) {
> > -
> >  			slave_image->locked = 1;
> >  			mutex_unlock(&slave_image->mtx);
> >  			allocated_image = slave_image;
> > @@ -510,7 +509,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
> >  		    ((master_image->cycle_attr & cycle) == cycle) &&
> >  		    ((master_image->width_attr & dwidth) == dwidth) &&
> >  		    (master_image->locked == 0)) {
> > -
> >  			master_image->locked = 1;
> >  			spin_unlock(&master_image->lock);
> >  			allocated_image = master_image;
> > @@ -682,10 +680,8 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
> >  		count = length - offset;
> >  
> >  	return bridge->master_read(image, buf, count, offset);
> > -
> >  }
> >  EXPORT_SYMBOL(vme_master_read);
> > -
> 
> This line needs to be there, checkpatch should not have complained about
> it.
> 

Hmm, ACK. It complained, as below:

CHECK: Blank lines aren't necessary after an open brace '{'
#311: FILE: drivers/staging/vme_user/vme.c:311:
+		    (slave_image->locked == 0)) {
+
--
CHECK: Blank lines aren't necessary after an open brace '{'
#513: FILE: drivers/staging/vme_user/vme.c:513:
+		    (master_image->locked == 0)) {
+
--
CHECK: Blank lines aren't necessary before a close brace '}'
#684: FILE: drivers/staging/vme_user/vme.c:684:
+
+}
--
CHECK: Blank lines aren't necessary before a close brace '}'
#686: FILE: drivers/staging/vme_user/vme.c:686:
+
+}
--
CHECK: Blank lines aren't necessary after an open brace '{'
#890: FILE: drivers/staging/vme_user/vme.c:890:
+		    (dma_ctrlr->locked == 0)) {
+
--

Should I keep them then and forget this patch?

> thanks,
> 
> greg k-h

Thank you.

Alexon Oliveira
