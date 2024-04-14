Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE773364A1
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713094022; cv=none; b=cnu/PdKu2femO/Cj/sv22XiNtlsUUg+1x8OKW6r/IfnMMccaiO5DxMPF/4oJkNn8oTU639o3G138dBejQ1cF7/2m620/yE4ZR1DIla/z8ZCbcr1OYZKdtud7v08TcXCU2lEHi/nDQ9LWnoirvVeOQX4Uyj/YAUySHTjN1QREcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713094022; c=relaxed/simple;
	bh=5hT9/wxjmKlTopAdJcUF4+ERhJm5U95hvO0IQYA3dSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMaZOZ/zfRStRO5WNhCybfoTBjLJD5zn3PZ8M8eH3xdzUp/16aAxiXnpe4e0phwkRpoR3OOY//i8J52TMwS0czQRD5+XSEsOsmWKmX5va34I2XY0IZU3FK5UsYV3eZS4D/yCEeIQc14w9j/j7D3MiT/BqbAMV7UJzzWBKOKKJio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ef1IQ6qe; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ef1IQ6qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713094013; x=1713698813; i=wahrenst@gmx.net;
	bh=zgPCxsouHcIgEq/0nRQFy6LLdmtetUCvvoKryGB0ySE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ef1IQ6qeQ7YOEOmmBGP1o4I4SD/2GSu/zulU1rlaQjQaO8lV5+ca+pP/qIGXXXvz
	 UPw6InNdHB3Rj2nOWu8Fn7qOaq3UoGe8py1wIRAegvoyD+i1Xx5xSjHDBCROiAI7L
	 iJeTCOMAmMlmHXtEa5NypKJIQmohuAUGpi7ps84DNy2OPEErV5i//UtW5B0OAe2Qm
	 IzU1S8YLNQqkzYvY+Bno304mqEiOSVA+mffAlxcVENhsva3sS3OBySpJn+YgKDRxL
	 fLWLzdVVd1oytUWC2mHaK4z7ITYKnhBh0Abap20B1oBS09LGr+O+XS1mJu8WmaNO9
	 PtBNudDyptw1YH0kWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1sCoIx3ytP-00IR1G; Sun, 14
 Apr 2024 13:26:53 +0200
Message-ID: <66a3a9b7-973e-48a0-9f14-8c582db40736@gmx.net>
Date: Sun, 14 Apr 2024 13:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] staging: vc04_services: Move global g_state to
 vchiq_state
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-11-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-11-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z8XqGAaqYsP5NeLsrtxOq/pp/ZSmC4h9kHpO0pCc9RppapZ8frp
 V93Lec9xMs+9tCpc8u5LpoqLwFm932q4FdO068/Qj92j4AXQaZl7w9uq+9RCjJhwC7DgMYo
 r4QBFQwihostn8heXo0Z/vq/SY3hXXMMw3LLtNRVR6fudOUT4OvXLWd5k5Oak5/EJda7EBm
 QQy2M3U/su75TP1Qhs04Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3/y4Hah9uZw=;mVEls93udZC8D8PaKajC6iaj/Vy
 qpwwwPeARuqw0VczVf/YDLxaIo7UfPMJF1W1cJ0X30+sOcLIcPK4dXcTNqnVMDHD0gTQigziw
 vCRZliEgtQ5N5Ff2oEzfvjUUJrt7tEy0ZGkh7CAfFdoDkV9NHn8pUDIiwURXLmC7UBRf9LiIP
 XUOAws6dlLof3HgK+ZTvOOpz1yTlwjV5ujO4hmGC5YgkzJH9GZFNXLmV2f2AlIZpWLuAh5Cwn
 xyEl3okU9BsKf0T4ydb4TITD33DjDW4iFWteEEYtONsi17x0KzpPxlI7gUnxJl+z0B2oSzXdI
 ws4tmj3lmRgWFQM6ApdrwrzkNbzOlEejua7c5o/UdriWTbD4Sy24HCzIGDyDzyFeo0pw5E2y+
 b5zchnawai1+NCM/viONR4XrQBamcuhDk2DLrPuLul/Nnw09ikSo4mQoE4tWD6JQTZIhE6KQe
 BzdvspPCw/NuLPC1XZVzdoDD4cBtXepxvVyn8mK3tKQ9cLK0Lr8ud9WmFvP9MalsyJ/6yujM/
 IQ+gXWRv50yEjxR/9Ow9KPvH2ouk01TpAWCUHbXuzmR9aH2GR7agTQoO4+4ixp9sgHCMN08jy
 EXzNU652HlQJr+a6+HtkPjjwKhr2CUBYpqhy7OuktkE/Fw/ytT+LPFkFEX1smL7BLiPX8Gj5b
 GvL323wM25hI1v2HIsiR851517g7BdwfZN/838cFAs9qqvYf0z2VSfAabLcMjXP08tSX43csT
 Uww+iN5LctUBFb9FkbEIdZJ75qh6qc6bSY4AGSO0uxcYoYLnj6YrVDvmUBtRczTezRgINwk6E
 Y4dWvuzNd/Q7ijCCRKTxJxXm+OcPSjuE3zoqT6eJqTJzw=

Hi Umang,

just 2 nits

Am 12.04.24 um 09:57 schrieb Umang Jain:
> The patch intended to drop the g_state pointer.
> g_state is supposed to be a central place to track the state
> via vchiq_state. This is now moved to be contained in the
> struct vchiq_drv_mgmt. As a result vchiq_get_state() is also removed.
>
> In order to have access to vchiq_drv_mgmt, vchiq_initialise()
> and vchiq_mmal_init() are modified to receive a struct device pointer
> as one of their function parameter
>
> The vchiq_state pointer is now passed directly to
> vchiq_dump_platform_instances() to get access to the state instead
> getting it via vchiq_get_state().
>
> For the char device, struct miscdevice is retrieved by struct file's
> private data in vchiq_open and struct vchiq_drv_mgmt is retrieved
> thereafter.
>
> Removal of global variable members is now addressed hence, drop
> the corresponding item from the TODO list.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../bcm2835-audio/bcm2835-vchiq.c             |  5 ++-
>   .../bcm2835-camera/bcm2835-camera.c           |  4 +--
>   .../include/linux/raspberrypi/vchiq.h         |  4 ++-
>   drivers/staging/vc04_services/interface/TODO  |  8 -----
>   .../interface/vchiq_arm/vchiq_arm.c           | 36 +++++--------------
>   .../interface/vchiq_arm/vchiq_arm.h           |  7 ++--
>   .../interface/vchiq_arm/vchiq_core.c          |  2 +-
>   .../interface/vchiq_arm/vchiq_core.h          |  2 +-
>   .../interface/vchiq_arm/vchiq_debugfs.c       |  5 ++-
>   .../interface/vchiq_arm/vchiq_dev.c           | 10 +++---
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  6 ++--
>   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  3 +-
>   12 files changed, 37 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c=
 b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index d74110ca17ab..133ed15f3dbc 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -7,6 +7,8 @@
>   #include "bcm2835.h"
>   #include "vc_vchi_audioserv_defs.h"
>
> +#include "../interface/vchiq_arm/vchiq_arm.h"
> +
>   struct bcm2835_audio_instance {
>   	struct device *dev;
>   	unsigned int service_handle;
> @@ -175,10 +177,11 @@ static void vc_vchi_audio_deinit(struct bcm2835_au=
dio_instance *instance)
>
>   int bcm2835_new_vchi_ctx(struct device *dev, struct bcm2835_vchi_ctx *=
vchi_ctx)
>   {
> +	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(dev->parent);
>   	int ret;
>
>   	/* Initialize and create a VCHI connection */
> -	ret =3D vchiq_initialise(&vchi_ctx->instance);
> +	ret =3D vchiq_initialise(&mgmt->state, &vchi_ctx->instance);
>   	if (ret) {
>   		dev_err(dev, "failed to initialise VCHI instance (ret=3D%d)\n",
>   			ret);
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera=
.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index c3ba490e53cb..b3599ec6293a 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1555,7 +1555,7 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
>   	u32 param_size;
>   	struct vchiq_mmal_component  *camera;
>
> -	ret =3D vchiq_mmal_init(&dev->instance);
> +	ret =3D vchiq_mmal_init(dev->v4l2_dev.dev, &dev->instance);
>   	if (ret < 0) {
>   		v4l2_err(&dev->v4l2_dev, "%s: vchiq mmal init failed %d\n",
>   			 __func__, ret);
> @@ -1854,7 +1854,7 @@ static int bcm2835_mmal_probe(struct vchiq_device =
*device)
>   		return ret;
>   	}
>
> -	ret =3D vchiq_mmal_init(&instance);
> +	ret =3D vchiq_mmal_init(&device->dev, &instance);
>   	if (ret < 0)
>   		return ret;
>
> diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vch=
iq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> index 52e106f117da..6c40d8c1dde6 100644
> --- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> +++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> @@ -48,6 +48,7 @@ struct vchiq_element {
>   };
>
>   struct vchiq_instance;
> +struct vchiq_state;
>
>   struct vchiq_service_base {
>   	int fourcc;
> @@ -78,7 +79,8 @@ struct vchiq_service_params_kernel {
>   	short version_min;   /* Update for incompatible changes */
>   };
>
> -extern int vchiq_initialise(struct vchiq_instance **pinstance);
> +extern int vchiq_initialise(struct vchiq_state *state,
> +			    struct vchiq_instance **pinstance);
>   extern int vchiq_shutdown(struct vchiq_instance *instance);
>   extern int vchiq_connect(struct vchiq_instance *instance);
>   extern int vchiq_open_service(struct vchiq_instance *instance,
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index 05eb5140d096..15f12b8f213e 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet ten=
ds to go 3 or 4 levels of
>   indentation deep making it very unpleasant to read. This is specially =
relevant
>   in the character driver ioctl code and in the core thread functions.
>
> -* Get rid of all non essential global structures and create a proper pe=
r
> -device structure
> -
> -The first thing one generally sees in a probe function is a memory allo=
cation
> -for all the device specific data. This structure is then passed all ove=
r the
> -driver. This is good practice since it makes the driver work regardless=
 of the
> -number of devices probed.
> -
>   * Clean up Sparse warnings from __user annotations. See
>   vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bul=
k_waiter"
>   is never disclosed to userspace.
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 4bdd383a060c..502ddc0f6e46 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -59,8 +59,6 @@
>   #define KEEPALIVE_VER 1
>   #define KEEPALIVE_VER_MIN KEEPALIVE_VER
>
> -struct vchiq_state g_state;
> -
>   /*
>    * The devices implemented in the VCHIQ firmware are not discoverable,
>    * so we need to maintain a list of them in order to register them wit=
h
> @@ -698,9 +696,8 @@ void vchiq_dump_platform_state(struct seq_file *f)
>   }
>
>   #define VCHIQ_INIT_RETRIES 10
> -int vchiq_initialise(struct vchiq_instance **instance_out)
> +int vchiq_initialise(struct vchiq_state *state, struct vchiq_instance *=
*instance_out)
>   {
> -	struct vchiq_state *state;
>   	struct vchiq_instance *instance =3D NULL;
>   	int i, ret;
>
> @@ -710,7 +707,6 @@ int vchiq_initialise(struct vchiq_instance **instanc=
e_out)
>   	 * block forever.
>   	 */
>   	for (i =3D 0; i < VCHIQ_INIT_RETRIES; i++) {
> -		state =3D vchiq_get_state();
>   		if (state)
>   			break;
>   		usleep_range(500, 600);
> @@ -1026,9 +1022,10 @@ add_completion(struct vchiq_instance *instance, e=
num vchiq_reason reason,
>   	       void *bulk_userdata)
>   {
>   	struct vchiq_completion_data_kernel *completion;
> +	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(instance->state->dev);
Please make it the first line of the declarations
>   	int insert;
>
> -	DEBUG_INITIALISE(g_state.local);
> +	DEBUG_INITIALISE(mgmt->state.local);
>
>   	insert =3D instance->completion_insert;
>   	while ((insert - instance->completion_remove) >=3D MAX_COMPLETIONS) {
...
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/dri=
vers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 680961a7c61b..fca920d41e4f 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -26,6 +26,7 @@
>   #include <media/videobuf2-vmalloc.h>
>
>   #include "../include/linux/raspberrypi/vchiq.h"
> +#include "../interface/vchiq_arm/vchiq_arm.h"
>   #include "mmal-common.h"
>   #include "mmal-vchiq.h"
>   #include "mmal-msg.h"
> @@ -1852,7 +1853,7 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance=
 *instance)
>   }
>   EXPORT_SYMBOL_GPL(vchiq_mmal_finalise);
>
> -int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
> +int vchiq_mmal_init(struct device *dev, struct vchiq_mmal_instance **ou=
t_instance)
>   {
>   	int status;
>   	int err =3D -ENODEV;
> @@ -1865,6 +1866,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **o=
ut_instance)
>   		.callback		=3D mmal_service_callback,
>   		.userdata		=3D NULL,
>   	};
> +	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(dev->parent);
here too
