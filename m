Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3863B5;
	Fri, 10 Mar 2023 12:10:04 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so4855950wms.0;
        Fri, 10 Mar 2023 04:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678450203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUAuSSPihufsLwgjlVUlKLuXucoFIBlJ+9NyNxEoo98=;
        b=ZESYpzUhv7+DuMbIjF977hrg9hstxGIBskEMYk5RCkD8E5uUg/0ZNbjW/iE1lv6pOP
         6nu9fydk1vICd+WfgHAydze4VtPWdXdTnCZ2YKi9i8Z3QnOkvIfsg3Rju5IzbFgcgeG2
         SV0eZe+wc8YK6F5rAqFuTFJl60lgy55GG/EHOXeb/GcJip04jmf6Ed5YPJA/sVF0IFvL
         yPQH2KxZSgx0TT70gWk5ZQ/c+pQeCuC14wpXR9JJrWJD/fU9tgcbm7f1fvDeUGJkzNWc
         duTOjJJX7YoIVBNhTHoTSADtfcHHotsPkyX28Tgi2O9W+s7sXsUYZVHLd75SXK9ejEx4
         w++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678450203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUAuSSPihufsLwgjlVUlKLuXucoFIBlJ+9NyNxEoo98=;
        b=UmFkEOW5xbFSxAScxrEmlc7VeZ6w3z0YJdPIA0bLVAy49slMmWR076hjR4A+xuXWmK
         JCQMJX+lI3D02Pki9f54eKiZS9CFQt1UMcALxz43KKE2+ZbOa3mIpfi8qjCwnlv54O2I
         Zdc6jGXUIORErsoGrlF8gSQtGe0kwmU0IOWRWM/urb9rkaSzrLmtNsPsdAoEo1fdRLRv
         GAIGgVBNDVl9F1lyeHRLr12GyBM+GCkqfKvqd3TQNo7kF9L+vEPSsER4pJsQy/4SLs9E
         oEReAK4yOeOKENcZyWZ1QHzqMqiAbwGBr8rx49Rhcf5/eeymKndYBSLDbdzdVv7NcYku
         haPA==
X-Gm-Message-State: AO0yUKV42zoVgyZwTbF9tqHhBuiFnRFopLoxYrn4VC6c/0INk5GnlmzU
	u8RoKWhZVd1yJQKQpR3+GqI=
X-Google-Smtp-Source: AK7set9drKQBOGo1Ki4CARaraRy7/TexN2tg5PXXGGfnbPbHcQ5aYlYlVu2CBKstMtd0qhXarFjKRQ==
X-Received: by 2002:a05:600c:524f:b0:3e2:5c3:bcfc with SMTP id fc15-20020a05600c524f00b003e205c3bcfcmr2534635wmb.18.1678450202989;
        Fri, 10 Mar 2023 04:10:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y10-20020a7bcd8a000000b003eb5a0873e0sm1907730wmj.39.2023.03.10.04.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 04:10:02 -0800 (PST)
Date: Fri, 10 Mar 2023 15:09:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	paskripkin@gmail.com, gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: Fixed block comment
Message-ID: <bb4e7ac8-5ddf-46c7-8c5a-08839794c5d0@kili.mountain>
References: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
 <10238267.qUNvkh4Gvn@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10238267.qUNvkh4Gvn@suse>

On Fri, Mar 10, 2023 at 12:52:55PM +0100, Fabio M. De Francesco wrote:
> On venerdì 17 febbraio 2023 08:17:00 CET Khadija Kamran wrote:
> > Fixed block comment by adding '*' in each line. The Check message was
> > shown by using checkpatch.pl script.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> 
> Hi Khadija,
> 
> As Greg said this driver is not here any longer. This makes me think that you 
> forgot at least two things...
> 
> 1) Please pull and rebase the staging tree every day while working on patches 
> during this period of the Outreachy project. If you had done so, you would 
> have noticed that your patch cannot any more be applied.

This patch was sent long before the driver was deleted...  The patch was
fine and would have been applied if the driver hadn't been removed.

regards,
dan carpenter

