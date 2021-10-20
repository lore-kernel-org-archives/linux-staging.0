Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD62C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 13:25:49 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 21so16116222plo.13
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KD04hsmi0lgerCpXrek0NWCbVNI3Lu/Nr105uWRTo8c=;
        b=JXX65j3hX2NvMlynDH+nRMiKJKnN5UveBhRRhING9zBMpxapQoY7K6lmkEsfwoXcNE
         +1wr5fwA2lmJPifFvCPcxsWfmUqdIp41SkQn/KQzajtgqpm4++tkOjjyv8VCgnWd8xqk
         mVBv6xtmXQCdigbe32XYl/NPu30bCMIAOuewuQntcuhLQvJHb8l3F+WoLWF4woZGpN2o
         kK3+B4EdBIr8tb9tj6k1yPO/DC3fsBU62T6Z0KTsODb+oGjfLl+P5ouwsUuCAWfTYHUj
         KHpzg3DrrdGFNlVZ8m0EDYQhumuN49+1D7drhPy2NcIbmVmDX4J6rtBhyTwb/b3601s+
         BBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KD04hsmi0lgerCpXrek0NWCbVNI3Lu/Nr105uWRTo8c=;
        b=zQ/54yRtqRfVr1UaAHLORG46JgD4AOB1ZXA/Meg+mXZtYlBTeK8w40nizVmO2+0HPF
         YkYlwTCqs3lInOpx5pjQBNPH5oIVZY23YPeVoG6qRA4/1xT4VYIJNNEgPRtLLzi+3ibe
         xujZ90Oo0q49TxY5Du5GaF7bIIAxrdtXLtSJFSdGaLnwewL+UQh3VThk2w77BcVdN4Lj
         2aiietlvN2ccpts61DcSQvZwJ8jKz0+Er0NIuRv4GMrFFpoDF8SqCwHrvG3jf0rcPyHn
         cYj67L36u9MoLf5iUnh0bBaIe8bYbUAAAqQ4lBO5TGD2AaqVNIXGxI3dO53PTvVOjUSa
         rPyQ==
X-Gm-Message-State: AOAM532fzl4QGIg6V4Z13oAvUc6G1sBR5FbyyKcwHg8qom9cIzJgYt1v
	TCpH85D/ygFwZPDXuNv7Ty8=
X-Google-Smtp-Source: ABdhPJzEi+qF735DLvHgQoE5spz6cr2+SraesD/tRcTWc4xIQmSNH+/QZzgW1zjdcZjiyfzfw4Npew==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id mh18mr45250pjb.18.1634736349097;
        Wed, 20 Oct 2021 06:25:49 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id v9sm2556719pjc.55.2021.10.20.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:25:48 -0700 (PDT)
Message-ID: <721eda4c6b65a0c0da4b85e1b24bada769890816.camel@gmail.com>
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Yang Yingliang
 <yangyingliang@huawei.com>,  Dinghao Liu <dinghao.liu@zju.edu.cn>, Alan
 <alan@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 20 Oct 2021 22:25:43 +0900
In-Reply-To: <YW1Vj5jGybs8gXWr@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <20211017161958.44351-3-kitakar@gmail.com>
	 <YW1Vj5jGybs8gXWr@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 14:07 +0300, Andy Shevchenko wrote:
> On Mon, Oct 18, 2021 at 01:19:42AM +0900, Tsuchiya Yuto wrote:
> > When comparing with intel-aero atomisp [1], it looks like
> > punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
> > up case.
> > 
> > Code from the intel-aero kernel [1]:
> > 
> >         int atomisp_mrfld_power_down(struct atomisp_device *isp)
> >         {
> >         [...]
> >         	/*WA:Enable DVFS*/
> >         	if (IS_CHT)
> >         		punit_ddr_dvfs_enable(true);
> > 
> >         int atomisp_mrfld_power_up(struct atomisp_device *isp)
> >         {
> >         [...]
> >         	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
> >         	if (IS_CHT)
> >         		punit_ddr_dvfs_enable(false);
> > 
> > This patch fixes the inverted argument as per the intel-aero code, as
> > well as its comment. While here, fix space issues for comments in
> > atomisp_mrfld_power().
> > 
> > Note that it does not seem to be possible to unify the up/down cases for
> > punit_ddr_dvfs_enable(), i.e., we can't do something like the following:
> > 
> >         if (IS_CHT)
> >         	punit_ddr_dvfs_enable(!enable);
> > 
> > because according to the intel-aero code [1], the DVFS is disabled
> > before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
> > "writing 0x3 to ISPSSPM0 bit[1:0]".
> > 
> > [1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514
> > 
> > Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > index 0511c454e769..f5362554638e 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > @@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> >  
> >  	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
> >  
> > -	/*WA:Enable DVFS*/
> > +	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
> 
> P-Unit

Thanks, I'll fix this next time I send.

> >  	if (IS_CHT && enable)
> > -		punit_ddr_dvfs_enable(true);
> > +		punit_ddr_dvfs_enable(false);
> >  
> >  	/*
> >  	 * FIXME:WA for ECS28A, with this sleep, CTS
> >  	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
> >  	 * PASS, no impact on other platforms
> > -	*/
> > +	 */
> >  	if (IS_BYT && enable)
> >  		msleep(10);
> >  
> > @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> >  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
> >  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
> >  
> > -	/*WA:Enable DVFS*/
> > +	/* WA:Enable DVFS */
> >  	if (IS_CHT && !enable)
> >  		punit_ddr_dvfs_enable(true);
> >  
> > -- 
> > 2.33.1
> > 
> > 
> 

