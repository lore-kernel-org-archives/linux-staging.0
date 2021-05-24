Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFF117F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 15:33:07 +0000 (UTC)
IronPort-SDR: L/PFq7i+H9Oa5iP4SCaGJc8fm5oqpy9ViILNDZv0rPdaSCcHIOnBYhuROQ6PqncAD2vBuaTMIH
 47fPHz9F7vDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="265858917"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="265858917"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:32:52 -0700
IronPort-SDR: TSVuQCCO5bDPRFhHJiq8iyGKubH2rl6VexUUuLqrub78lkVQiJ7iAfQdGmkUIOjaMn0STbV+rf
 9dKksCxla/3w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="396432635"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:32:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 8095B202F7;
	Mon, 24 May 2021 18:32:47 +0300 (EEST)
Date: Mon, 24 May 2021 18:32:47 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: trix@redhat.com
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, drv@mailo.com,
	martinsdecarvalhobeatriz@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: atomisp: improve error handling in
 gc2235_detect()
Message-ID: <20210524153247.GQ3@paasikivi.fi.intel.com>
References: <20210521194805.2078135-1-trix@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521194805.2078135-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tom,

On Fri, May 21, 2021 at 12:48:05PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this representative problem
> 
> atomisp-gc2235.c:867:20: warning: The right operand
>   of '|' is a garbage value
>         id = ((high << 8) | low);
>                           ^ ~~~
> When gc2235_read_reg() fails, its return val is never written.
> 
> For gc2235_detect(), high and low are or-ed and compared
> with GC2235_ID, 0x2235.  Initialize both to 0 and skip
> checking the read returns, it's errors are not passed up, only
> -ENODEV is.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 38defa0f81513..3b6e02b1f45d1 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -849,21 +849,14 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
>  static int gc2235_detect(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
> -	u16 high, low;
> -	int ret;
> +	u16 high = 0, low = 0;
>  	u16 id;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>  		return -ENODEV;
>  
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SENSOR_ID_H, &high);
> -	if (ret) {
> -		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
> -		return -ENODEV;

It'd be nice if the function returned a different value for different
errors, such as there was an I/O error and that the ID was wrong.

> -	}
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SENSOR_ID_L, &low);
> +	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_H, &high);
> +	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_L, &low);
>  	id = ((high << 8) | low);
>  
>  	if (id != GC2235_ID) {

-- 
Sakari Ailus
