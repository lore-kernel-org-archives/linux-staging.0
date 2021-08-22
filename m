Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E672
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:58:56 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mHqo0-0008Gc-AP; Sun, 22 Aug 2021 18:58:44 +0200
Date: Sun, 22 Aug 2021 18:58:44 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] staging: r8188eu: clean up the usb_writeN
Message-ID: <20210822165844.2h6yt42ejshw7tnc@viti.kaiser.cx>
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-8-martin@kaiser.cx>
 <6593f24b-8986-df5f-e2ba-5358360939df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6593f24b-8986-df5f-e2ba-5358360939df@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Michael,

Thus wrote Michael Straube (straube.linux@gmail.com):

> On 8/21/21 6:48 PM, Martin Kaiser wrote:
> > Remove unnecessary variables, check the length.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 +++++----------
> >   1 file changed, 5 insertions(+), 10 deletions(-)

> > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > index e01f1ac19596..5408383ccec3 100644
> > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > @@ -151,20 +151,15 @@ static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
> >   static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
> >   {
> > -	u16 wvalue;
> > -	u16 len;
> > +	u16 wvalue = (u16)(addr & 0x0000ffff);
> >   	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
> > -	int ret;
> > -
> > +	if (length > VENDOR_CMD_MAX_DATA_LEN)
> > +		return -EINVAL;
> > -	wvalue = (u16)(addr & 0x0000ffff);
> > -	len = length;
> > -	memcpy(buf, pdata, len);
> > +	memcpy(buf, pdata, length);

> Hi Martin, shouldn't this be

> memcpy(buf, pdata, (length & 0xffff));

I don't think this makes any difference. I've already checked that
length <= VENDOR_CMD_MAX_DATA_LEN, which is 254. memcpy takes a size_t
parameter for the number of bytes to copy. length will not overflow
this.

Best regards,
Martin
