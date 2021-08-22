Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538A72
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 17:04:41 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mHqtf-0008Kr-7j; Sun, 22 Aug 2021 19:04:35 +0200
Date: Sun, 22 Aug 2021 19:04:35 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] staging: r8188eu: remove unnecessary cast
Message-ID: <20210822170435.ijsi7ep7rbdu4i3k@viti.kaiser.cx>
References: <20210821164859.4351-1-martin@kaiser.cx>
 <CAA=Fs0mU0bkXPY35fkuudoWfAps2jp1qc3ga53LXgg6d+0bVSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=Fs0mU0bkXPY35fkuudoWfAps2jp1qc3ga53LXgg6d+0bVSg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Phillip Potter (phil@philpotter.co.uk):

> On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:

> > name is a const char * by default. This type should be ok for r8188eu.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >  drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > index e002070f7fba..72556ac10d7d 100644
> > --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> > +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > @@ -61,7 +61,7 @@ struct rtw_usb_drv {
> >  };

> >  static struct rtw_usb_drv rtl8188e_usb_drv = {
> > -       .usbdrv.name = (char *)"r8188eu",
> > +       .usbdrv.name = "r8188eu",
> >         .usbdrv.probe = rtw_drv_init,
> >         .usbdrv.disconnect = rtw_dev_remove,
> >         .usbdrv.id_table = rtw_usb_id_tbl,
> > --
> > 2.20.1

Hi Phil,

> Looks ok to me, thanks. I would consider using a cover letter style
> [PATCH 00/10] style approach as an addition in future though, just my
> personal opinion.

> Acked-by: Phillip Potter <phil@philpotter.co.uk>

Thanks.

This series is a mixed bag of things I found while poking around in the
code. So I didn't think there was anything useful to say in a cover
letter. Still, I see your point, it makes sense for a patch series to
have a cover letter, I'll add one for future patch series.

Best regards,
Martin
