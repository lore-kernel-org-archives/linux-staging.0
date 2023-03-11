Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983987B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:58:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bw19so6842231wrb.13
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 20:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678510737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWrYWGEWJpm9K9yfT9nzGGJ5sy1Of9IhiPOVpfzpCHQ=;
        b=KHXFkWBQMG7BaAB7JAEIBcqUIldt995YKSFwkZVZdUBkysGqtmso+PJgP8aMKODmqe
         xIM1LVDHnSrZsdTEZQebGmmPEx+fPxJF8KmRbkWHm098yYYCP/pxh3VAj+tU5+uHmABc
         rv19DYx01nuArytOTEcYq7BjE2KENYFlah71B92UWyb9Mbearn6+vbTyImK1+iHqls9B
         Ydm0lzNK9X7iKGe8mKPUY5r95zt8DG9WWv6ijKBXMHpRij/kXpaZiNJEdiXGJewbqCir
         66IKYtFid1yMeH7tu0PzV4ihCPXtbEnNh+z8BBC+f6N4mSPdwxEaSTRl8hCyHBMJ+U3H
         iHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678510737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWrYWGEWJpm9K9yfT9nzGGJ5sy1Of9IhiPOVpfzpCHQ=;
        b=jketvAunobHse+NvjuA+RbTWukdpcPNWhrhICCZJeXm65L5+0XgtPcpKSOFz8dyFZ5
         PwapiJSWdgzPpW44mN/P+hE9M7JTZgLGwcsL56srNoLbQkJOURotW/Ll85Ycb91e5rJ6
         BWsL6eiHyD96Lr6JQ20V80Ff33wvseQ/2bHPTQPuLf7mNgnpjm5azmQSxxeLA9lu2J3e
         vo//bWMAUcjcrOrahnRcmUi2YqxBIlrsf6Z2CMAtMOkqNTiVHCuR20kkXCJ4ixnkwEAZ
         j6KYjjjFRJa3Q1jf+VKTcskRKC8HpgEeyuwhKNE/Y45uczYKcYSrze4RDH8StTucPyJx
         JSYw==
X-Gm-Message-State: AO0yUKXyFtcTWVCRSopwlKjFMULJBmfQAGYOHMP8NqaHdaFz0yl8Rtnc
	xwhtZSrD/9BAVizea/4aH90=
X-Google-Smtp-Source: AK7set8kplnzo8WYidik7/RrrVtWZzKZqQvmTL3l+ZktpYC3uic36j8nMqu85W0NJJjh72EkaQCKdw==
X-Received: by 2002:adf:f852:0:b0:2c5:68a9:843f with SMTP id d18-20020adff852000000b002c568a9843fmr3354082wrq.4.1678510736744;
        Fri, 10 Mar 2023 20:58:56 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003eb68bb61c8sm1631485wme.3.2023.03.10.20.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:58:55 -0800 (PST)
Date: Sat, 11 Mar 2023 07:58:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Archana <craechal@gmail.com>
Cc: drv@mailo.com, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] staging: wlan-ng: remove else statement
Message-ID: <14be11a8-722c-4520-9e1b-5b147bb3d3fc@kili.mountain>
References: <20230310205917.2161-1-craechal@gmail.com>
 <20230310205917.2161-2-craechal@gmail.com>
 <a4096cdc-97d1-4265-8ce4-b8021ecf5933@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4096cdc-97d1-4265-8ce4-b8021ecf5933@kili.mountain>

On Sat, Mar 11, 2023 at 07:34:25AM +0300, Dan Carpenter wrote:
> On Fri, Mar 10, 2023 at 08:59:17PM +0000, Archana wrote:
> > else block is not needed if j is set to -1
> > before if block
> > 
> > Signed-off-by: Archana <craechal@gmail.com>
> > ---
> 
> Is Archana your full legal name that you would write on a legal document?

Ah, never mind.  Apparently this policy has been updated.  Pseudonyms
are allowed for people concerned about privacy but anonymous
contributions are not allowed.

https://lore.kernel.org/all/ZAoMxSPKNLoLg7Wl@aschofie-mobl2/

regards,
dan carpenter

