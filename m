Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6568829CA
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 07:43:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id i1so2967448pla.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K5nXQuoXfpQ5nXhfs+AzvDvp+MXS3PPaAvbJII5i9wQ=;
        b=qBtXY+eTBCL7UigNPBDg2Zds9N10oaeGEP15IMYGw6Ze5E5htvg/BvUadfPllxI2x/
         T6LjyhaqnIImpt2ww6tZ+eDrAgjalOIk3QdBkucKJwz/muy4QVpNFicle6FI5ZPn1Ejm
         VbXoiJ/OQ+IAI5tjdIMbxDnSOtY2pVUZ2eL5Ok+bCSdfMKj2N9HtSv95VIKJWrk6t/YV
         4fS5mCVLSebIw49DYSqu43g2mECyN1aBVcNgmr5row2GZo+SaniTQo4KhG8HtbowXycD
         Nc3lU+WYbimxqNvlutTS8F4U8Gtfh9FxSJzgwLHe/8nRPomFPxNkvfxdBuuU/JsWv1j5
         sfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K5nXQuoXfpQ5nXhfs+AzvDvp+MXS3PPaAvbJII5i9wQ=;
        b=CPpOE1VrP6yB3o4DP9EehTs9ZB0LopDLZBhzw+je+YYDU6ESHcJ2YjyLCK3QPGcvlI
         nh3hywiWc8C8PgPX2FtDSHYrpT1Qv7OeulpR+AKZrCIARbrUqwyztFu95LlKknGMP0Rg
         reACXcJbNy0qDFBdu61jgBTdBlCwK6CwgfIHFrKMccgB4cSKZBxCV6ypvnBdbFqS2JM7
         qae2UX015FSl56Uzyj4vzDxGAvC1g9rhQy6/UASOXeCwpMQsTQuUOsErqeCJ3+D444Gb
         oHgq51Y1T0Cu//6hjhft6eS1tic8DesQaos4Q+4TzSVDya+ClnxIoLVslu3yK62ixTEo
         QJDg==
X-Gm-Message-State: AOAM532Yu3mbDgE5uNhGinMdcuBDK3YwfJ+uJMg7vjlL2UmwklhfYE9R
	5TT/rq1mMtcuShlZUeflKXZ30z9h5vW64g==
X-Google-Smtp-Source: ABdhPJyG5Ebo9L4PlWzO6aM75I3S+4SJgYgiB9wM5Od+WHLQNh+48uDQLPe2+q/UrRIduc2ZllNhXQ==
X-Received: by 2002:a17:902:d502:b0:14a:6d74:7fed with SMTP id b2-20020a170902d50200b0014a6d747fedmr9747850plg.23.1642923794010;
        Sat, 22 Jan 2022 23:43:14 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id d14sm12583677pfv.189.2022.01.22.23.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 23:43:13 -0800 (PST)
Date: Sun, 23 Jan 2022 20:43:08 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] staging: pi433: validate min/max bit rate settings
Message-ID: <20220123074308.GA79751@mail.google.com>
References: <20220118193422.GA3155@mail.google.com>
 <20220118230312.GA4826@mail.google.com>
 <20220119060400.GL1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119060400.GL1951@kadam>

On Wed, Jan 19, 2022 at 09:04:00AM +0300, Dan Carpenter wrote:
> I'm fine with this.
> 
> Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> But please do add the note to the TODO.
> 
> regards,
> dan carpenter

Hi Dan, 

Thanks for the Acked-by. The TODO note was added on 0/3 of this patch
series:

https://lore.kernel.org/lkml/20220118230555.GA4961@mail.google.com/

thanks,

Paulo Almeida
