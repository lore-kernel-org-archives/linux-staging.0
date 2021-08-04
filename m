Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91670
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 14:21:16 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mBHlf-0000JZ-53; Wed, 04 Aug 2021 16:21:11 +0200
Date: Wed, 4 Aug 2021 16:21:11 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove RT_TRACE and DBG_88E prints
 from ioctl_linux.c
Message-ID: <20210804142111.pukmtsxaqdixll3r@viti.kaiser.cx>
References: <20210802073917.8647-1-martin@kaiser.cx>
 <20210804131214.GK1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804131214.GK1931@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Mon, Aug 02, 2021 at 09:39:17AM +0200, Martin Kaiser wrote:
> > @@ -4203,7 +3940,6 @@ static int rtw_dbg_port(struct net_device *dev,
> >  			u16 start_value = 0;
> >  			u32 write_num = extra_arg;
> >  			int i;
> > -			u8 final;
> >  			struct xmit_frame	*xmit_frame;

> >  			xmit_frame = rtw_IOL_accquire_xmit_frame(padapter);
> > @@ -4216,12 +3952,6 @@ static int rtw_dbg_port(struct net_device *dev,
> >  				rtw_IOL_append_WB_cmd(xmit_frame, reg, i+start_value, 0xFF);
> >  			if (_SUCCESS != rtw_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0))
> >  				ret = -EPERM;
> > -
> > -			final = rtw_read8(padapter, reg);
> > -			if (start_value+write_num-1 == final)
> > -				DBG_88E("continuous IOL_CMD_WB_REG to 0x%x %u times Success, start:%u, final:%u\n", reg, write_num, start_value, final);
> > -			else
> > -				DBG_88E("continuous IOL_CMD_WB_REG to 0x%x %u times Fail, start:%u, final:%u\n", reg, write_num, start_value, final);
> >  		}

> I don't have a problem with the patch but these tests don't make any
> sense now that we don't print a Success/Fail at the end.  (We should
> probably delete the whole function and all the related code)

I removed the IOL tests (case 0x78) in v2, similar to the rtl8723bs
driver.

Thanks,
Martin
