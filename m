Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE54297;
	Thu,  3 Mar 2022 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646347443; x=1677883443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LGs61FMx3IeFD9eB7+GKLp/0tGX59gvBzS7laALfEFU=;
  b=Qoj4Czbzm0i46ZcgET7urXNO2jxDQ1y44FLZ5RIf8zOoHPzlnG7+fL/1
   CqBVIQbpx4jgkWOy/dVNxInBRTCl7R9kYAs2XO7yPKhW2wJQH14pDnqru
   x4QUt1TLfwHDw5ImLlZgVj98IRvbh5vsvrd3N+0cPwf2kN+ehpcNQOpcZ
   zfbPtv8DQmeG3EkM9QrhckjnJvS/OjoC8MJNJRDF/w6UNO/QR9lpRG00c
   o0Q92NV1sfOWha+brR2ABNUS+/9pi8i8GNEtqppQETZoba21edU09Q0im
   2eiR+Xq8KzpEuq6LQxTUfMFs/PduZVETykDkfNHB7vafqE42+0bB4RIIH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="340267241"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; 
   d="scan'208";a="340267241"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 14:44:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; 
   d="scan'208";a="642299153"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 14:43:57 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 33DDE20150;
	Fri,  4 Mar 2022 00:43:55 +0200 (EET)
Date: Fri, 4 Mar 2022 00:43:55 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 30/66] media: sun6i-csi: Add bridge v4l2 subdev with
 port management
Message-ID: <YiFEq1liAnBy0fkq@paasikivi.fi.intel.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-31-paul.kocialkowski@bootlin.com>
 <YgqbqVRinNxQ8+WV@paasikivi.fi.intel.com>
 <Yh+GZv9/rKQ2WbI2@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh+GZv9/rKQ2WbI2@aptenodytes>

Hi Paul,

On Wed, Mar 02, 2022 at 03:59:50PM +0100, Paul Kocialkowski wrote:
> > > +static int
> > > +sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
> > > +				struct v4l2_subdev *remote_subdev,
> > > +				struct v4l2_async_subdev *async_subdev)
> > > +{
> > > +	struct sun6i_csi_device *csi_dev =
> > > +		container_of(notifier, struct sun6i_csi_device,
> > > +			     bridge.notifier);
> > > +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
> > > +	struct sun6i_csi_bridge_source *source = NULL;
> > > +	struct fwnode_handle *fwnode = dev_fwnode(csi_dev->dev);
> > > +	struct fwnode_handle *handle = NULL;
> > > +	bool enabled;
> > > +	int ret;
> > > +
> > > +	while ((handle = fwnode_graph_get_next_endpoint(fwnode, handle))) {
> > 
> > I'd instead store the information you need here in struct sun6i_csi_bridge.
> > You could remove the loop here.
> 
> Is there a different method for matching a remote subdev to a local port?
> The rationale here is that I need the handle for fwnode_graph_parse_endpoint
> but cannot get that handle from the remote subdev's fwnode pointer directly.

You generally shouldn't try to match fwnodes here as the V4L2 async
framework has already done that job. This information can be found behind
the async_subdev pointer.

See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2-main.c for an example.

> 
> > > +		struct fwnode_endpoint endpoint = { 0 };
> > > +		struct fwnode_handle *remote_fwnode;
> > > +
> > > +		remote_fwnode = fwnode_graph_get_remote_port_parent(handle);
> > > +		if (!remote_fwnode)
> > > +			continue;
> > > +
> > > +		if (remote_fwnode != remote_subdev->fwnode)
> > > +			goto next;
> > > +
> > > +		ret = fwnode_graph_parse_endpoint(handle, &endpoint);
> > > +		if (ret < 0)
> > > +			goto next;
> > > +
> > > +		switch (endpoint.port) {
> > > +		case SUN6I_CSI_PORT_PARALLEL:
> > > +			source = &bridge->source_parallel;
> > > +			enabled = true;
> > > +			break;
> > > +		default:
> > > +			break;
> > > +		}
> > > +
> > > +next:
> > > +		fwnode_handle_put(remote_fwnode);
> > > +	}
> > > +
> > > +	if (!source)
> > > +		return -EINVAL;
> > > +
> > > +	source->subdev = remote_subdev;
> > > +
> > > +	return sun6i_csi_bridge_link(csi_dev, SUN6I_CSI_BRIDGE_PAD_SINK,
> > > +				     remote_subdev, enabled);
> > > +}
> > > +
> > > +static int
> > > +sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
> > > +{
> > > +	struct sun6i_csi_device *csi_dev =
> > > +		container_of(notifier, struct sun6i_csi_device,
> > > +			     bridge.notifier);
> > > +
> > > +	return sun6i_csi_v4l2_complete(csi_dev);
> > 
> > You could call v4l2_device_register_subdev_nodes() here.
> 
> That's definitely what sun6i_csi_v4l2_complete does (the diff is probably not
> very clear). Note that the wrapper is extended later on to register the capture
> video device for the no-isp path.

I could be missing something... Do you need to call
sun6i_csi_v4l2_complete() in multiple places or not? If not, then I think
it'd be probably better to just move the code here.

> 
> Maybe the capture registration could be kept in sun6i_csi_probe for the non-isp
> path and then the wrapper wouldn't be needed. I don't mind either way.

-- 
Kind regards,

Sakari Ailus
