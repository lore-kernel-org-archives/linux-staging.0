Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6A746C
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662062222; x=1693598222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xQHzX/ExjVIf/lcA63Q3pivfdcP3ND9I6BaxCe7ENyM=;
  b=cQ7tTzQ0DamrwYtc9SqZSDwu43Pm607bVdbiHupiHx1YmBtecOcmjcSG
   NMocOcfoAhdtalfwDNLcPuPl8kScWJH/5lR27vDp98OOxgj41IrxwZ25v
   i2NmYztgKR1gh7FtkxWt4NlyroZ0COuw67N3Dx+1vCfasrq5yPwQvbgjt
   oLW7dCTQjTkXJ55RQXqT7TfmJ7C0oVSeJVG50aOfOBeZG+vxguhFbDgzq
   lZexg5nofhMZQWmjc8j8S6/b8uqztgOaij0d93P85LnVfVNnXYwkx4BiV
   2f5KlwNnqQKvbBK9I1YHvCMvlunQfqiQFB+VQ87wEdGE2zT9bNXNWMvg+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382113354"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="382113354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:57:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="754970762"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:56:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oTqJ6-0071Z0-0j;
	Thu, 01 Sep 2022 22:56:56 +0300
Date: Thu, 1 Sep 2022 22:56:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end
 of atomisp_pci_probe()
Message-ID: <YxEOhy0YPnBuZiQs@smile.fi.intel.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
 <20220901094626.11513-11-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901094626.11513-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:
> Register /dev/* nodes at the end of atomisp_pci_probe(), this is
> a prerequisite for dropping the loading mutex + ready flag kludge
> for delaying open() calls on the /dev/* nodes .

...

>  			for (; i > 0; i--)
>  				atomisp_subdev_unregister_entities(
>  				    &isp->asd[i - 1]);

This...

> +	for (i = 0; i < isp->num_of_streams; i++) {
> +		err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
> +		if (err)
> +			return err;
> +	}

...and this looks like a dup.

Perhaps a helper?

-- 
With Best Regards,
Andy Shevchenko


