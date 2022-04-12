Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C17B;
	Tue, 12 Apr 2022 04:18:17 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id r25so4968245qtp.8;
        Mon, 11 Apr 2022 21:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d3gadAUNlKv8bSmk8ozUNQ57JoV0EMyK41V7hk2NsaY=;
        b=pQ8XobVHV9m4ZwlpgncYHftEUXqi3sygBZ3wETiMY+vZyy+zyFdCiEwkKc8LRc/Cve
         2O57NQ/ItTJ/Bu6oQaA0BY50T7mTO0ZszeGUz4vB0PFjDJkAVhrYO3e3l9k39K/1hRJb
         OxSmSw9PxvtcZqpEtCqmk4m3/48moDM6PibvpksaP06U0HisjLTX+LqYnkQk2dlo08xo
         JqZGSXZWBpvs9/ZNVuoGN08c2HczpOpwZWlS9heRNu6cGVb0z+lsKJuWTb7Yy1A+wSTz
         FS6OTUbyfwdvrJebIaBfPlip6e0NmKG6dp6WRz8PsY/Qre0y1A+BLfuRR95UrrPeAyaI
         q+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d3gadAUNlKv8bSmk8ozUNQ57JoV0EMyK41V7hk2NsaY=;
        b=tJPBPyRfEnnjzRD/tQb7xyvr8S+gmJdt52qFk2xoadHcYkbPIzlq3hMzXQ8lNY7DtD
         Py5Lx+mTrt5jWNbjuZJLhn3w8djcgP7uj6TCvcq6F1znjcNk+qfmAeM0IQRz5EJuZDzr
         xwatdGY5xTMq1Vuxxqt+CRNsggo88c4EQ5dBSDBZHP+U+LM8+tVcKQflQNHvsbYK1nUb
         u3ek0kQAnmSZlaJ6OdzjDB3WaOviOYWmQBdC6aL6H2LrvzcX5fgD0JO70Exu6AYeHo6G
         e0dKcdrNEVEegCynedHFYD/F/XAcqAg0wh8Q18mJYNd3HaM1sIBUjW+EPrjhdeZAh+Ir
         DDPw==
X-Gm-Message-State: AOAM530kMzziW4XihhEUPcokUeh9TsMKrK2YpLpYp5rEjqKqFZkaG/E4
	9sv0A3te6c/cFthHiowRY9ImmKwlpssbvgV/
X-Google-Smtp-Source: ABdhPJxHcEarg8p7YxCErNj5Geoz6SfLjmlOsUYn7TqDYaETL4gT4YfGq1AF1vv7hwh1pbngh6yjBQ==
X-Received: by 2002:ac8:5685:0:b0:2ed:f44:49d3 with SMTP id h5-20020ac85685000000b002ed0f4449d3mr1919934qta.435.1649737096413;
        Mon, 11 Apr 2022 21:18:16 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id l21-20020a05620a211500b0069bf630f3b4sm5942431qkl.125.2022.04.11.21.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 21:18:15 -0700 (PDT)
Date: Tue, 12 Apr 2022 00:18:13 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefano Brivio <sbrivio@redhat.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v2] staging: wfx: use container_of() to get vif
Message-ID: <20220412041813.GA2860081@jaehee-ThinkPad-X1-Extreme>
References: <20220408032349.GA2132476@jaehee-ThinkPad-X1-Extreme>
 <Yk++AMDTu7LCbjHu@kroah.com>
 <20220408074424.6e862f3f@elisabeth>
 <2419031.jE0xQCEvom@pc-42>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2419031.jE0xQCEvom@pc-42>

On Sat, Apr 09, 2022 at 04:07:12PM +0200, Jérôme Pouiller wrote:
> On Friday 8 April 2022 07:44:24 CEST Stefano Brivio wrote:
> > On Fri, 8 Apr 2022 06:45:52 +0200 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > > On Thu, Apr 07, 2022 at 11:23:49PM -0400, Jaehee Park wrote:
> > > >
> > > > [...]
> > > >
> > > > @@ -61,7 +63,6 @@ struct wfx_dev {
> > > >
> > > >  struct wfx_vif {
> > > >     struct wfx_dev             *wdev;
> > > > -   struct ieee80211_vif       *vif;
> > >
> > > You need to test this on real hardware.  For an outreachy-first-task,
> > > this is not a good one at all.
> > 
> > We discussed about this on the outreachy list, and I suggested, as
> > Jaehee also mentioned, that maybe somebody (Jérôme?) with the hardware
> > could give it a try.
> >
> > It looks a bit difficult but it also looks almost correctly done now. :)
> 
> Absolutely.
> 
> I will test it once the various comments will be fixed.
> 
> 
> -- 
> Jérôme Pouiller
> 
>
I just wanted to update and let you know that I mailed a new patch v3 just now.
Thanks!
