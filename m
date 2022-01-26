Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD1168
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 08:56:02 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nCdgw-00017u-RR; Wed, 26 Jan 2022 09:30:10 +0100
Date: Wed, 26 Jan 2022 09:30:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: r8188eu: ODM_RF_CALIBRATION is always set
Message-ID: <20220126083010.g7cw77wcliydh3im@viti.kaiser.cx>
References: <20220122170547.68378-1-martin@kaiser.cx>
 <20220122170547.68378-4-martin@kaiser.cx>
 <20220126074917.GW1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126074917.GW1951@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Dan,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sat, Jan 22, 2022 at 06:05:46PM +0100, Martin Kaiser wrote:
> > @@ -36,10 +35,6 @@ static void Init_ODM_ComInfo_88E(struct adapter *Adapter)
> >  	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(hal_data->VersionID));

> >  	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
> > -
> > -	pdmpriv->InitODMFlag =	ODM_RF_CALIBRATION;
> > -
> > -	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);

> Wait, why did you remove the ODM_CmnInfoUpdate()?

I removed the last item that Init_ODM_ComInfo_88E added to
pdmpriv->InitODMFlag. Init_ODM_ComInfo_88E does no longer modify
pdmpriv->InitODMFlag, there's no need for updating the odm internal
status.

Best regards,

   Martin
