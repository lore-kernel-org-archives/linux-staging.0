Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15A2F21
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 14:16:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-172-J1tvwRiQPeqVqBMlrnKtLg-1; Sun, 06 Feb 2022 14:16:28 +0000
X-MC-Unique: J1tvwRiQPeqVqBMlrnKtLg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 6 Feb 2022 14:16:26 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 6 Feb 2022 14:16:26 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'joelcchangg@gmail.com'" <joelcchangg@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"gregkh@linuxfoundation.com" <gregkh@linuxfoundation.com>
Subject: RE: [PATCH] staging: octeon-usb: Fix 'should not end with '(''
Thread-Topic: [PATCH] staging: octeon-usb: Fix 'should not end with '(''
Thread-Index: AQHYGy2lT3+mOj+jAkq4B/NGasIIi6yGkYKQ
Date: Sun, 6 Feb 2022 14:16:26 +0000
Message-ID: <c0b504dd1f254f19b6ff60948684303b@AcuMS.aculab.com>
References: <20220206074615.3527-1-joelcchangg@gmail.com>
In-Reply-To: <20220206074615.3527-1-joelcchangg@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: joelcchangg@gmail.com
> Sent: 06 February 2022 07:46
>=20
> This patch fixes the checkpatch.pl check:
>=20
> CHECK: Line should not end with '('
>=20
> at lines 1802, 1807 and at some function headers.
>=20
> Signed-off-by: Joel Camilo Chang Gonzalez <joelcchangg@gmail.com>
> ---
>  drivers/staging/octeon-usb/octeon-hcd.c | 67 +++++++++++--------------
>  1 file changed, 29 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/oc=
teon-usb/octeon-hcd.c
> index a1cd81d4a114..60e8354104e6 100644
> --- a/drivers/staging/octeon-usb/octeon-hcd.c
> +++ b/drivers/staging/octeon-usb/octeon-hcd.c
> @@ -1792,23 +1792,18 @@ static void cvmx_usb_start_channel(struct octeon_=
hcd *usb, int channel,
>  =09case CVMX_USB_TRANSFER_INTERRUPT:
>  =09=09break;
>  =09case CVMX_USB_TRANSFER_ISOCHRONOUS:
> -=09=09if (!cvmx_usb_pipe_needs_split(usb, pipe)) {
> +=09=09if (!cvmx_usb_pipe_needs_split(usb, pipe) &&
> +=09=09    pipe->transfer_dir =3D=3D CVMX_USB_DIRECTION_OUT) {
>  =09=09=09/*
>  =09=09=09 * ISO transactions require different PIDs depending on
>  =09=09=09 * direction and how many packets are needed
>  =09=09=09 */
> -=09=09=09if (pipe->transfer_dir =3D=3D CVMX_USB_DIRECTION_OUT) {
> -=09=09=09=09if (pipe->multi_count < 2) /* Need DATA0 */
> -=09=09=09=09=09USB_SET_FIELD32(
> -=09=09=09=09=09=09CVMX_USBCX_HCTSIZX(channel,
> -=09=09=09=09=09=09=09=09   usb->index),
> +=09=09=09if (pipe->multi_count < 2) /* Need DATA0 */
> +=09=09=09=09USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
>  =09=09=09=09=09=09cvmx_usbcx_hctsizx, pid, 0);
> -=09=09=09=09else /* Need MDATA */
> -=09=09=09=09=09USB_SET_FIELD32(
> -=09=09=09=09=09=09CVMX_USBCX_HCTSIZX(channel,
> -=09=09=09=09=09=09=09=09   usb->index),
> +=09=09=09else /* Need MDATA */
> +=09=09=09=09USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
>  =09=09=09=09=09=09cvmx_usbcx_hctsizx, pid, 3);
> -=09=09=09}
>  =09=09}
>  =09=09break;
>  =09}

What has that hunk got to do with the patch description?

> @@ -2121,17 +2116,17 @@ static void cvmx_usb_complete(struct octeon_hcd *=
usb,
>   *
>   * Returns: Transaction or NULL on failure.
>   */
> -static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(
> -=09=09=09=09struct octeon_hcd *usb,
> -=09=09=09=09struct cvmx_usb_pipe *pipe,
> -=09=09=09=09enum cvmx_usb_transfer type,
> -=09=09=09=09u64 buffer,
> -=09=09=09=09int buffer_length,
> -=09=09=09=09u64 control_header,
> -=09=09=09=09int iso_start_frame,
> -=09=09=09=09int iso_number_packets,
> -=09=09=09=09struct cvmx_usb_iso_packet *iso_packets,
> -=09=09=09=09struct urb *urb)
> +static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(struct o=
cteon_hcd *usb,
> +=09=09=09=09=09=09=09=09struct cvmx_usb_pipe *pipe,
> +=09=09=09=09=09=09=09=09enum cvmx_usb_transfer type,
> +=09=09=09=09=09=09=09=09u64 buffer,
> +=09=09=09=09=09=09=09=09int buffer_length,
> +=09=09=09=09=09=09=09=09u64 control_header,
> +=09=09=09=09=09=09=09=09int iso_start_frame,
> +=09=09=09=09=09=09=09=09int iso_number_packets,
> +=09=09=09=09=09=09=09=09struct cvmx_usb_iso_packet
> +=09=09=09=09=09=09=09=09=09*iso_packets,
> +=09=09=09=09=09=09=09=09struct urb *urb)

Those lines are now far longer than is 'nice'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

