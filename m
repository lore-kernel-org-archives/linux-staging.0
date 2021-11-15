Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F72C80
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 13:50:57 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mmcNg-0008Ej-DM; Mon, 15 Nov 2021 14:50:44 +0100
Date: Mon, 15 Nov 2021 14:50:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/15] staging: r8188eu: remove test code for efuse
 shadow map
Message-ID: <20211115135044.zzudkdypmgivfnko@viti.kaiser.cx>
References: <20211113185518.23941-1-martin@kaiser.cx>
 <20211113185518.23941-4-martin@kaiser.cx>
 <20211115112748.GC26989@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115112748.GC26989@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Dan,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sat, Nov 13, 2021 at 07:55:06PM +0100, Martin Kaiser wrote:

> > -			if (_SUCCESS == ret)
> > -				goto exit;
> > -		}
> > +		if (_SUCCESS == ret)
> > +			return;
> >  	}
> > -	Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf, bPseudoTest);

> It looks like this changes how the code works here.  Originally we
> called Hal_EfuseReadEFuse88E() fir rtw_IOL_applied() was false or if
> iol_read_efuse() failed.

the call to Hal_EfuseReadEFuse88E is still there, it's below the part
that you quoted:

-       Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf, bPseudoTest);
-
-exit:
-       return;
-}
 
-static void ReadEFuse_Pseudo(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest)
-{
-       Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf, bPseudoTest);
+       Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf);
 }

The removal of ReadEFuse_Pseudo makes the diff a bit confusing. When I
checked the patches before posting, I stumbled across this part as well.

Best regards,
Martin
